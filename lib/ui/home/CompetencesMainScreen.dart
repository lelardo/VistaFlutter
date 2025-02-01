import 'package:flutter/material.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/SectionGrid.dart';
import 'package:mioconfluter/models/CompetenceClon.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'package:mioconfluter/models/CompetenceClonManager.dart';
import 'CompetenceItemScreen.dart';

class CompetencesMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CompetenceClon> items = CompetenceClonManager().competences;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, top: 0, bottom: 20),
              child: Text(
                "Competencias",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              child: SectionGrid(
                items: items,
                onItemSelected: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompetenceItemScreen(competence: items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}