import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // URL de la API
  final String baseUrl = 'http://172.23.64.1:8000/api/competences'; // Cambia la IP por la correcta

  try {
    // Hacer la solicitud GET
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, decodificar los datos
      List<dynamic> data = json.decode(response.body);

      // Imprimir los datos recibidos
      print('Datos recibidos:');
      data.forEach((item) {
        print(item);
      });
    } else {
      // Si la respuesta no es exitosa, mostrar el error
      print('Error: No se pudieron cargar los datos');
    }
  } catch (e) {
    // Si ocurre un error durante la solicitud
    print('Excepción capturada: $e');
  }
}
