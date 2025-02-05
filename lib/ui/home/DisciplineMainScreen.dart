import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mioconfluter/ui/home/DisciplineItemScreen.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/CustomDrawer.dart';
import 'widget/CustomBottomBar.dart';

class DisciplineMainScreen extends StatefulWidget {
  @override
  _DisciplineMainScreenState createState() => _DisciplineMainScreenState();
}

class _DisciplineMainScreenState extends State<DisciplineMainScreen> {
  late Future<List<dynamic>> disciplinesFuture;

  @override
  void initState() {
    super.initState();
    disciplinesFuture = fetchDisciplines();
  }

  Future<List<dynamic>> fetchDisciplines() async {
    final String url = 'http://172.23.64.1:8000/api/disciplines/';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al cargar las disciplinas');
      }
    } catch (e) {
      throw Exception('Excepción capturada: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<dynamic>>(
        future: disciplinesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron disciplinas.'));
          }

          final disciplines = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                  child: const Text(
                    "Disciplinas",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Aumentamos el número de columnas
                      crossAxisSpacing: 8, // Reducimos el espacio entre columnas
                      mainAxisSpacing: 8, // Reducimos el espacio entre filas
                      childAspectRatio: 2 / 3, // Ajustamos la proporción de los ítems
                    ),
                    itemCount: disciplines.length,
                    itemBuilder: (context, index) {
                      final discipline = disciplines[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisciplineItemScreen(disciplineIndex: disciplines[index]['id'],),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  discipline['image'] ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.image_not_supported);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0), // Reducimos el padding
                                child: Text(
                                  discipline['name'] ?? 'Sin nombre',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Reducimos el tamaño del texto
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}