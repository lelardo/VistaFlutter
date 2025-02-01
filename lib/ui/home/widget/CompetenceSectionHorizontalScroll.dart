import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/CompetenceItemScreen.dart';
import 'package:mioconfluter/ui/home/CompetencesMainScreen.dart';
import 'package:mioconfluter/models/CompetenceClon.dart';
import 'package:mioconfluter/models/CompetenceClonManager.dart';

class CompetenceSectionHorizontalScroll extends StatefulWidget {
  final String title;

  CompetenceSectionHorizontalScroll({
    required this.title,
  });

  @override
  _CompetenceSectionHorizontalScrollState createState() => _CompetenceSectionHorizontalScrollState();
}

class _CompetenceSectionHorizontalScrollState extends State<CompetenceSectionHorizontalScroll> {
  final List<CompetenceClon> competences = CompetenceClonManager().competences;
  int? hoveredIndex;
  bool isTitleHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFFBBFA63);
    final Color secondaryColor = Color(0xFFF3F3F3);
    final Color accentColor = Color(0xFF282229);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              isTitleHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isTitleHovered = false;
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompetencesMainScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: isTitleHovered
                      ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]
                      : [],
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: competences.length,
            itemBuilder: (context, index) {
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
                        builder: (context) => CompetenceItemScreen(competence: competences[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: hoveredIndex == index ? primaryColor : Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          competences[index].logo,
                          fit: BoxFit.cover,
                        ),
                      ),
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