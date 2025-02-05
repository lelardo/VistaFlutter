import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/EditionItemScreen.dart';
import 'package:mioconfluter/ui/home/widget/HeaderWidget.dart';
import 'package:mioconfluter/ui/home/widget/SectionHorizontalScroll.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'package:mioconfluter/ui/home/widget/MainAppBar.dart';
import 'package:mioconfluter/ui/home/widget/CompetenceSectionHorizontalScroll.dart' as competence;
import 'package:mioconfluter/models/PlanningClon.dart';
import 'package:mioconfluter/models/CompetenceEditionClon.dart';
import 'package:mioconfluter/ui/home/widget/DisciplineSectionHorizontalScroll.dart' as discipline;
import 'package:mioconfluter/models/DisciplineManager.dart';
import 'package:mioconfluter/ui/home/widget/TeamSectionHorizontalScroll.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final disciplines = DisciplineManager().disciplines;

    return Scaffold(
      appBar: MainAppBar(),
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
            ),
            TeamSectionHorizontalScroll(
              title: 'Equipos',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
