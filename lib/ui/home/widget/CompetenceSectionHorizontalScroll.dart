import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mioconfluter/ui/home/CompetenceItemScreen.dart';
import 'package:mioconfluter/ui/home/CompetencesMainScreen.dart';

class CompetenceSectionHorizontalScroll extends StatefulWidget {
  final String title;

  const CompetenceSectionHorizontalScroll({Key? key, required this.title}) : super(key: key);

  @override
  _CompetenceSectionHorizontalScrollState createState() => _CompetenceSectionHorizontalScrollState();
}

class _CompetenceSectionHorizontalScrollState extends State<CompetenceSectionHorizontalScroll> {
  late Future<List<Map<String, dynamic>>> competencesFuture;
  int? hoveredIndex;
  bool isTitleHovered = false;

  @override
  void initState() {
    super.initState();
    competencesFuture = fetchCompetences();
  }

  Future<List<Map<String, dynamic>>> fetchCompetences() async {
    final String baseUrl = 'http://172.23.64.1:8000/api/competences';

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map<Map<String, dynamic>>((item) => {
          'id': item['id'],
          'name': item['name'] ?? 'Sin nombre',
          'logo': item['logo']?.replaceFirst('http://localhost:8000/', 'http://172.23.64.1:8000/') ?? '',
        }).toList();
      } else {
        throw Exception('Error al cargar las competencias');
      }
    } catch (e) {
      throw Exception('Excepción capturada: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFBBFA63);
    const Color secondaryColor = Color(0xFFF3F3F3);
    const Color accentColor = Color(0xFF282229);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isTitleHovered = true),
          onExit: (_) => setState(() => isTitleHovered = false),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompetencesMainScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: isTitleHovered
                    ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                )
                    : null,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        FutureBuilder<List<Map<String, dynamic>>>(
          future: competencesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No competences found.'));
            }

            final competences = snapshot.data!;

            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: competences.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    onEnter: (_) => setState(() => hoveredIndex = index),
                    onExit: (_) => setState(() => hoveredIndex = null),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompetenceItemScreen(
                              competenceId: competences[index]['id'],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 160,
                              height: 130,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: hoveredIndex == index ? primaryColor : Colors.black26,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: competences[index]['logo'].isNotEmpty
                                    ? Image.network(
                                  competences[index]['logo'],
                                  fit: BoxFit.cover,
                                )
                                    : Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported, size: 50),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              competences[index]['name'],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
