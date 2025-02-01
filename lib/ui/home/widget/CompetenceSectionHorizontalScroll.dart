import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/CompetenceItemScreen.dart';
import 'package:mioconfluter/ui/home/CompetencesMainScreen.dart';
import 'package:mioconfluter/models/CompetenceClon.dart';
import 'package:mioconfluter/models/CompetenceClonManager.dart';

class CompetenceSectionHorizontalScroll extends StatefulWidget {
  final String title;

  const CompetenceSectionHorizontalScroll({Key? key, required this.title}) : super(key: key);

  @override
  _CompetenceSectionHorizontalScrollState createState() => _CompetenceSectionHorizontalScrollState();
}

class _CompetenceSectionHorizontalScrollState extends State<CompetenceSectionHorizontalScroll> {
  final List<CompetenceClon> competences = CompetenceClonManager().competences;
  int? hoveredIndex;
  bool isTitleHovered = false;

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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CompetencesMainScreen()),
            ),
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
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: competences.length,
            itemBuilder: (context, index) {
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = null),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompetenceItemScreen(competence: competences[index]),
                    ),
                  ),
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
                            child: Image.network(
                              competences[index].logo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          competences[index].name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
