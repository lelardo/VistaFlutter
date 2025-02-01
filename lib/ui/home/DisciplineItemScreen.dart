import 'package:flutter/material.dart';
import 'widget/InfoCard.dart';
import 'package:mioconfluter/models/DisciplineClone.dart';
import 'package:mioconfluter/ui/home/widget/SimpleAppBar.dart';
import 'package:mioconfluter/ui/home/widget/HeaderWidget.dart';
import 'package:mioconfluter/ui/home/widget/RuleItem.dart';

class DisciplineItemScreen extends StatelessWidget {
  final DisciplineClone discipline;

  DisciplineItemScreen({required this.discipline});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(title: discipline.name, imageUrl: discipline.logo),
            InfoCard(title: 'Superficie', content: '${discipline.surface}'),
            SizedBox(height: 8),
            InfoCard(title: 'Federación', content: '${discipline.federation}'),
            SizedBox(height: 16),
            Text('Reglas:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...discipline.rules.map((rule) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: RuleItem(
                  title: '${rule.ruleDescription}',
                  index: int.parse(rule.numeration),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}