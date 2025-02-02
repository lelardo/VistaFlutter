import 'package:flutter/material.dart';
import 'package:mioconfluter/ApiSistem/ApiServiceCompetence.dart';
import 'package:mioconfluter/models/models.dart';

class CompetenceGridScreen extends StatefulWidget {
  @override
  _CompetenceGridScreenState createState() => _CompetenceGridScreenState();
}

class _CompetenceGridScreenState extends State<CompetenceGridScreen> {
  late Future<List<Competence>> competencesFuture;

  @override
  void initState() {
    super.initState();
    competencesFuture = ApiServiceCompetence().fetchCompetences(); // Usamos el servicio para obtener las competencias
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Competencias'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Competence>>(
        future: competencesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron competencias.'));
          } else {
            final competences = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas en la cuadrícula
                crossAxisSpacing: 10, // Espacio entre columnas
                mainAxisSpacing: 10, // Espacio entre filas
                childAspectRatio: 0.75, // Proporción de altura y ancho de las celdas
              ),
              itemCount: competences.length,
              itemBuilder: (context, index) {
                final competence = competences[index];
                return GestureDetector(
                  onTap: () {
                    // Aquí puedes agregar lógica para mostrar más detalles de la competencia
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            competence.logo,
                            fit: BoxFit.cover,
                            height: 120, // Altura fija para las imágenes
                            width: double.infinity, // Ancho completo
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            competence.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            competence.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
