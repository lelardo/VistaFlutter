import 'package:flutter/material.dart';
import 'package:mioconfluter/models/DisciplineClone.dart';
import 'package:mioconfluter/models/DisciplineManager.dart';
import 'package:mioconfluter/ui/home/DisciplineItemScreen.dart';
import 'package:mioconfluter/ui/home/widget/DisciplineSectionGrid.dart';
import 'widget/SimpleAppBar.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';

class Disciplinemainscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DisciplineClone> items = DisciplineManager().disciplines;

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
                "Disciplinas",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              child: DisciplineSectionGrid(
                items: items,
                onItemSelected: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisciplineItemScreen(discipline: items[index]),
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