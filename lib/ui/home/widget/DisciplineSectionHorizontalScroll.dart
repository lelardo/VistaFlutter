import 'package:flutter/material.dart';
import 'package:mioconfluter/models/DisciplineClone.dart';
import 'package:mioconfluter/ui/home/DisciplineItemScreen.dart';
import 'package:mioconfluter/ui/home/DisciplineMainScreen.dart';

class DisciplineSectionHorizontalScroll extends StatefulWidget {
  final String title;
  final List<DisciplineClone> disciplines;

  DisciplineSectionHorizontalScroll({required this.title, required this.disciplines});

  @override
  _DisciplineSectionHorizontalScrollState createState() => _DisciplineSectionHorizontalScrollState();
}

class _DisciplineSectionHorizontalScrollState extends State<DisciplineSectionHorizontalScroll> {
  int? hoveredIndex;
  bool isTitleHovered = false;

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
                MaterialPageRoute(builder: (context) => Disciplinemainscreen()),
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.disciplines.length,
            itemBuilder: (context, index) {
              final discipline = widget.disciplines[index];
              return MouseRegion(
                onEnter: (_) {
                  setState(() {
                    hoveredIndex = index;
                  });
                },
                onExit: (_) {
                  setState(() {
                    hoveredIndex = null;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisciplineItemScreen(discipline: discipline),
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
                              discipline.logo,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          discipline.name,
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