import 'package:flutter/material.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/InfoCard.dart';
import 'widget/CustomDrawer.dart';
import 'widget/CustomBottomBar.dart';
import 'package:mioconfluter/models/CompetenceEditionClon.dart';

class EditionItemScreen extends StatelessWidget {
  final CompetenceEditionClon edition;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  EditionItemScreen({required this.edition});

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título de la Edición',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: InfoCard(title: 'Fecha de Inicio', content: formatDate(edition.planning.fechaInicio))),
                SizedBox(width: 16),
                Expanded(child: InfoCard(title: 'Fecha de Fin', content: formatDate(edition.planning.fechaFin))),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Etapas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: edition.stages.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Acción al tocar el elemento
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFb9ff66),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFb9ff66).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Etapa ${index + 1}', style: TextStyle(color: Colors.black)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Inicio: ${formatDate(edition.stages[index].planning.fechaInicio)}', style: TextStyle(color: Colors.black)),
                            Text('Fin: ${formatDate(edition.stages[index].planning.fechaFin)}', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Text(
              'Equipos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: edition.teams.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Acción al tocar el elemento
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFb9ff66),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFb9ff66).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          edition.teams[index].logo,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 16),
                        Text(edition.teams[index].name, style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}