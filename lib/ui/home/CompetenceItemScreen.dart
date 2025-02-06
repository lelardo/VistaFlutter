import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/HeaderWidget.dart';
import 'widget/InfoCard.dart';
import 'widget/RuleItem.dart';
import 'widget/SingleChoice.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/ApiSistem/ApiUrlProvider.dart';

class CompetenceItemScreen extends StatefulWidget {
  final int competenceId;

  CompetenceItemScreen({required this.competenceId});

  @override
  _CompetenceItemScreenState createState() => _CompetenceItemScreenState();
}

class _CompetenceItemScreenState extends State<CompetenceItemScreen> {
  InfoOptions selectedOption = InfoOptions.mainInfo;
  bool isHovered = false;
  late Future<Map<String, dynamic>> futureCompetence;

  @override
  void initState() {
    super.initState();
    futureCompetence = fetchCompetence(widget.competenceId);
  }

  Future<Map<String, dynamic>> fetchCompetence(int id) async {
    final String baseUrl = '${ApiUrlProvider.getUrl()}competences/$id/';
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al cargar la competencia');
      }
    } catch (e) {
      throw Exception('Excepción capturada: $e');
    }
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureCompetence,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No se encontraron datos'));
          }

          final competence = snapshot.data!;

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidget(
                      title: competence['name'] ?? 'Sin nombre',
                      imageUrl: competence['logo'] ?? '',
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
                      InfoCard(title: 'Disciplina', content: competence['discipline'].toString()),
                      InfoCard(title: 'Fecha de Registro', content: '01/01/2023'), // Este campo no está en la API, lo dejamos fijo
                      InfoCard(title: 'Formato', content: competence['competence_format'].toString()),
                      InfoCard(title: 'Descripción', content: competence['description'] ?? 'Sin descripción'),
                      Text(" "),
                      Text('Reglas:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (competence['rule_list'] as List<dynamic>).map((rule) {
                          return RuleItem(
                            title: '${rule['numeration']}. ${rule['rule_description']}',
                            index: rule['numeration'],
                          );
                        }).toList(),
                      ),
                    ] else ...[
                      Text('Ediciones anteriores...'),
                      // Aquí puedes agregar la lógica para mostrar ediciones anteriores si es necesario
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
          );
        },
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}