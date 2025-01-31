import 'package:flutter/material.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/SectionGrid.dart';
import 'package:mioconfluter/models/GridItemData.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';

class CompetencesMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GridItemData> items = List.generate(10, (index) {
      return GridItemData(
        title: 'Item ${index + 1}',
        imageUrl: 'https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg',
      );
    });

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
              child: SectionGrid(items: items),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}