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
import 'package:mioconfluter/ui/home/widget/CompetenceSectionHorizontalScroll.dart' as competence;
import 'package:mioconfluter/models/PlanningClon.dart';
import 'package:mioconfluter/models/CompetenceEditionClon.dart';
import 'package:mioconfluter/models/StageClon.dart';
import 'package:mioconfluter/models/TeamClone.dart';
import 'package:mioconfluter/models/DisciplineClone.dart';
import 'package:mioconfluter/ui/home/widget/DisciplineSectionHorizontalScroll.dart' as discipline;
import 'package:mioconfluter/models/DisciplineManager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final disciplines = DisciplineManager().disciplines;

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
              child: competence.CompetenceSectionHorizontalScroll(
                title: 'Competencias',
              ),
            ),
            discipline.DisciplineSectionHorizontalScroll(
              title: 'Disciplinas',
              disciplines: disciplines,
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