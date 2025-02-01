import 'package:flutter/material.dart';
import 'package:mioconfluter/models/CompetenceClon.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/HeaderWidget.dart';
import 'widget/InfoCard.dart';
import 'widget/RuleItem.dart';
import 'widget/SingleChoice.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/EditionItemScreen.dart';

class CompetenceItemScreen extends StatefulWidget {
  final CompetenceClon competence;

  CompetenceItemScreen({required this.competence});

  @override
  _CompetenceItemScreenState createState() => _CompetenceItemScreenState();
}

class _CompetenceItemScreenState extends State<CompetenceItemScreen> {
  InfoOptions selectedOption = InfoOptions.mainInfo;
  bool isHovered = false;

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: widget.competence.name,
                  imageUrl: widget.competence.logo,
                ),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChoice(
                      selectedOption: selectedOption,
                      onOptionChanged: (InfoOptions newOption) {
                        setState(() {
                          selectedOption = newOption;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                if (selectedOption == InfoOptions.mainInfo) ...[
                  InfoCard(title: 'Disciplina', content: widget.competence.disciplina),
                  InfoCard(title: 'Fecha de Registro', content: '01/01/2023'),
                  InfoCard(title: 'Formato', content: widget.competence.format),
                  InfoCard(title: 'Descripción', content: widget.competence.description),
                  InfoCard(title: 'Reglas', content: ''),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.competence.rules.map((rule) {
                      return RuleItem(
                        title: '${rule.numeration}. ${rule.ruleDescription}',
                        index: int.parse(rule.numeration),
                      );
                    }).toList(),
                  ),
                ] else ...[
                  Text('Ediciones anteriores...'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.competence.editions.length,
                    itemBuilder: (context, index) {
                      final edition = widget.competence.editions[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditionItemScreen(
                                edition: edition,
                              ),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFb9ff66).withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Edición ${index + 1}'),
                              Text(formatDate(edition.planning.fechaInicio)),
                              Text(formatDate(edition.planning.fechaFin)),
                            ],
                          ),
                        ),
                        onHighlightChanged: (isHighlighted) {
                          setState(() {
                            // Cambia el tamaño del contenedor cuando se hace clic
                            if (isHighlighted) {
                              // Encoge el contenedor
                            } else {
                              // Restaura el tamaño original
                            }
                          });
                        },
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: isHovered ? 150 : 56,
                height: 56,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}