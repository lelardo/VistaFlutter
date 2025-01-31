import 'package:flutter/material.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/InfoCard.dart';
import 'widget/CustomDrawer.dart';
import 'widget/CustomBottomBar.dart';
class EditionItemScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> etapas = List.generate(5, (index) {
      return {
        'identificativo': 'Fecha ${index + 1}',
        'inicio': '01/01/2023',
        'fin': '02/01/2023',
      };
    });

    List<Map<String, String>> equipos = List.generate(10, (index) {
      return {
        'nombre': 'Equipo ${index + 1}',
        'logo': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      };
    });

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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: InfoCard(title: 'Fecha de Inicio', content: '01/01/2023')),
                SizedBox(width: 16),
                Expanded(child: InfoCard(title: 'Fecha de Fin', content: '31/12/2023')),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Etapas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: etapas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Acción al tocar el elemento
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(etapas[index]['identificativo']!),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Inicio: ${etapas[index]['inicio']}'),
                            Text('Fin: ${etapas[index]['fin']}'),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: equipos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Acción al tocar el elemento
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          equipos[index]['logo']!,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 16),
                        Text(equipos[index]['nombre']!),
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