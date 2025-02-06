import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widget/SimpleAppBar.dart';
import 'widget/HeaderWidget.dart';
import 'widget/InfoCard.dart';
import 'widget/SingleChoice.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';

class TeamItemScreen extends StatefulWidget {
  final int teamId; // Recibimos el ID del equipo en lugar del objeto completo.

  TeamItemScreen({required this.teamId});

  @override
  _TeamItemScreenState createState() => _TeamItemScreenState();
}

class _TeamItemScreenState extends State<TeamItemScreen> {
  InfoOptions selectedOption = InfoOptions.mainInfo;
  late Map<String, dynamic> teamData;
  bool isLoading = true;
  bool hasError = false;

  // Método para formatear la fecha
  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  // Método para hacer la solicitud HTTP y obtener los datos del equipo
  Future<void> fetchTeamData() async {
    final url = 'http://172.23.64.1:8000/api/teams/${widget.teamId}/'; // Utilizamos el ID para obtener el equipo específico.
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          teamData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTeamData(); // Llamamos a la función para obtener los datos del equipo.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Mientras cargamos, mostramos un indicador de carga.
          : hasError
          ? Center(child: Text('Error al cargar datos del equipo')) // En caso de error.
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HeaderWidget ahora toma los datos dinámicos obtenidos de la API.
            HeaderWidget(
              title: teamData['name'],
              imageUrl: teamData['logo'],
            ),
            SizedBox(height: 16),
            Center(
              child: ClipRRect(
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
            ),
            SizedBox(height: 16),
            if (selectedOption == InfoOptions.mainInfo) ...[
              // Usamos el valor obtenido de la API para mostrar el país.
              InfoCard(title: 'País', content: teamData['country']),
            ] else ...[
              Text('Plantillas:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: teamData['squads'].length,
                itemBuilder: (context, index) {
                  final squad = teamData['squads'][index];
                  return MouseRegion(
                    onEnter: (_) => setState(() {}),
                    onExit: (_) => setState(() {}),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFBBFA63).withOpacity(0.6),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text('Plantilla ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${formatDate(DateTime.parse(squad['footballSeason']['fechaInicio']))} - ${formatDate(DateTime.parse(squad['footballSeason']['fechaFin']))}'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
