import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mioconfluter/ui/home/DisciplineItemScreen.dart';
import 'package:mioconfluter/ui/home/DisciplineMainScreen.dart';

class DisciplineSectionHorizontalScroll extends StatefulWidget {
  final String title;

  DisciplineSectionHorizontalScroll({required this.title});

  @override
  _DisciplineSectionHorizontalScrollState createState() => _DisciplineSectionHorizontalScrollState();
}

class _DisciplineSectionHorizontalScrollState extends State<DisciplineSectionHorizontalScroll> {
  List<dynamic> disciplines = [];
  bool isLoading = true;
  int? hoveredIndex;
  bool isTitleHovered = false;

  @override
  void initState() {
    super.initState();
    fetchDisciplines();
  }

  Future<void> fetchDisciplines() async {
    final response = await http.get(Uri.parse('http://172.23.64.1:8000/api/disciplines/'));

    if (response.statusCode == 200) {
      setState(() {
        disciplines = json.decode(response.body);
        isLoading = false;
      });
    } else {
      // Manejo de errores
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFBBFA63);

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
                MaterialPageRoute(builder: (context) => DisciplineMainScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: isTitleHovered
                    ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.6),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                )
                    : null,
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: disciplines.length,
            itemBuilder: (context, index) {
              final discipline = disciplines[index];
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = null),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisciplineItemScreen(disciplineIndex: disciplines[index]['id'],),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: hoveredIndex == index ? primaryColor : Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              discipline['image'],
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          discipline['name'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
