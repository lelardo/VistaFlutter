import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompetencesMainScreen extends StatefulWidget {
  @override
  _CompetencesMainScreenState createState() => _CompetencesMainScreenState();
}

class _CompetencesMainScreenState extends State<CompetencesMainScreen> {
  late Future<List<Map<String, dynamic>>> competencesFuture;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Competencias")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
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

          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),
              itemCount: competences.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {}, // Agrega navegación si es necesario
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.network(
                              competences[index]['logo'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            competences[index]['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
