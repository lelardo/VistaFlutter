import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widget/InfoCard.dart';
import 'package:mioconfluter/ui/home/widget/SimpleAppBar.dart';
import 'package:mioconfluter/ui/home/widget/HeaderWidget.dart';
import 'package:mioconfluter/ui/home/widget/RuleItem.dart';
import 'package:mioconfluter/ui/home/ApiSistem/ApiUrlProvider.dart';


class DisciplineItemScreen extends StatefulWidget {
  final int disciplineIndex;

  DisciplineItemScreen({required this.disciplineIndex});

  @override
  _DisciplineItemScreenState createState() => _DisciplineItemScreenState();
}

class _DisciplineItemScreenState extends State<DisciplineItemScreen> {
  Map<String, dynamic>? discipline;
  List<dynamic> rules = [];

  @override
  void initState() {
    super.initState();
    fetchDisciplineData();
  }

  Future<void> fetchDisciplineData() async {
    try {
      // Obtener la disciplina
      final disciplineResponse = await http.get(Uri.parse('${ApiUrlProvider.getUrl()}disciplines/${widget.disciplineIndex}/'));

      if (disciplineResponse.statusCode == 200) {
        setState(() {
          discipline = json.decode(disciplineResponse.body);
        });
      }
    } catch (e) {
      print('Error al cargar los datos de la disc: $e');
    }

    try {
      // Imprimir la URL para confirmar que el filtro es correcto
      final url = '${ApiUrlProvider.getUrl()}rule-disciplines?discipline=${widget.disciplineIndex}';
      print('Obteniendo reglas desde: $url');

      // Obtener las reglas asociadas
      final rulesResponse = await http.get(Uri.parse(url));
      if (rulesResponse.statusCode == 200) {
        setState(() {
          rules = json.decode(rulesResponse.body);
        });
      }
    } catch (e) {
      print('Error al cargar las reglas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (discipline == null) {
      return Scaffold(
        appBar: SimpleAppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: SimpleAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: discipline!['name'] ?? 'Nombre no disponible',
              imageUrl: discipline!['image']?.replaceFirst('http://localhost:8000/api/', 'http://172.23.64.1:8000/api/') ?? '',
            ),
            InfoCard(
              title: 'Superficie',
              content: discipline!['surface'] ?? 'No especificada',
            ),
            SizedBox(height: 8),
            InfoCard(
              title: 'Federación',
              content: discipline!['federation'] ?? 'No especificada',
            ),
            SizedBox(height: 16),
            Text(
              'Reglas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...rules.map((rule) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: RuleItem(
                  title: rule['rule_description'] ?? 'Sin descripción',
                  index: rule['numeration'] ?? 0,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}