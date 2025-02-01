import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/EditionItemScreen.dart';
import 'package:mioconfluter/ui/home/widget/HeaderWidget.dart';
import 'package:mioconfluter/ui/home/widget/SectionHorizontalScroll.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'package:mioconfluter/ui/home/widget/MainAppBar.dart';
import 'package:mioconfluter/ui/home/CompetencesMainScreen.dart';
import 'package:mioconfluter/ui/home/CompetenceItemScreen.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/models/CompetenceClon.dart';
import 'package:mioconfluter/models/Rule.dart';
import 'package:mioconfluter/ui/home/widget/CompetenceSectionHorizontalScroll.dart';
import 'package:mioconfluter/models/PlanningClon.dart';
import 'package:mioconfluter/models/CompetenceEditionClon.dart';
import 'package:mioconfluter/models/StageClon.dart';
import 'package:mioconfluter/models/TeamClone.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(showMenuIcon: false),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Competencias y Disciplinas',
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV-SUEhCLO68dZGhZaASDUWNT0DFufkxuWNA&s',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CompetenceSectionHorizontalScroll(
                title: 'Competencias',
              ),
            ),
            SectionHorizontalScroll(
              title: 'Disciplinas',
              imageUrls: [
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
              ],
              destination: CompetenceItemScreen(competence: CompetenceClon(
                name: 'Nombre de la competencia',
                description: 'Descripción de la competencia',
                logo: 'URL del logo',
                format: 'Formato de la competencia',
                disciplina: 'Disciplina de la competencia',
                rules: List.generate(5, (ruleIndex) {
                  return Rule(
                    numeration: '${ruleIndex + 1}',
                    ruleDescription: 'Descripción de la regla ${ruleIndex + 1}',
                    actor: 'Actor ${ruleIndex + 1}',
                    action: 'Acción ${ruleIndex + 1}',
                    typeRule: 'Tipo de regla ${ruleIndex + 1}',
                  );
                }),
                editions: List.generate(3, (editionIndex) {
                  return CompetenceEditionClon(
                    planning: PlanningClon(
                      fechaInicio: DateTime.now().subtract(Duration(days: editionIndex * 365)),
                      fechaFin: DateTime.now().subtract(Duration(days: (editionIndex * 365) - 30)),
                    ),
                    competenceId: 1,
                    stages: List.generate(2, (stageIndex) {
                      return StageClon(
                        planning: PlanningClon(
                          fechaInicio: DateTime.now().subtract(Duration(days: stageIndex * 30)),
                          fechaFin: DateTime.now().subtract(Duration(days: (stageIndex * 30) - 10)),
                        ),
                      );
                    }),
                    teams: List.generate(4, (teamIndex) {
                      return TeamClone(
                        name: 'Team ${teamIndex + 1}',
                        country : "papas",
                        logo: 'https://example.com/logo${teamIndex + 1}.png',
                      );
                    }),
                  );
                }),
              )),
            ),
            SectionHorizontalScroll(
              title: 'Equipos',
              imageUrls: [
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
              ],
              destination: EditionItemScreen(
                edition: CompetenceEditionClon(
                  planning: PlanningClon(
                    fechaInicio: DateTime.now(),
                    fechaFin: DateTime.now().add(Duration(days: 30)),
                  ),
                  competenceId: 1,
                  stages: [],
                  teams: [],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}