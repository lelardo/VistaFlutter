import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mioconfluter/models/models.dart';

class ApiServiceCompetence {
  // Método para obtener las competencias desde la API
  Future<List<Competence>> fetchCompetences() async {
    final String baseUrl = 'http://172.23.64.1:8000/api/competences'; // Asegúrate de que la URL sea correcta
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, parseamos el JSON
      List<dynamic> jsonData = json.decode(response.body);

      // Convertir los datos en instancias de Competence
      return jsonData.map((json) {
        // Aquí, se usa la fábrica de Competence para crear las instancias
        return Competence.fromJson(json);
      }).toList();
    } else {
      // Si falla la carga, lanzamos una excepción
      throw Exception('Failed to load competences');
    }
  }
}
