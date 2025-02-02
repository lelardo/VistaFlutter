import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mioconfluter/models/models.dart';

class ApiService {
  // Cambia la URL base dependiendo de tu configuración
  // Si estás usando un servidor en tu PC, asegúrate de usar la IP local
  final String baseUrl = 'http://172.23.64.1:8000/api/'; // Para emulador de Android
  // O si usas un dispositivo físico, cambia a tu IP local, por ejemplo:
  // final String baseUrl = 'http://192.168.x.x:8000/api/';

  // Método genérico para manejar las respuestas
  Future<List<T>> fetchData<T>(String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}$endpoint'));

      // Imprime el código de estado y el cuerpo de la respuesta
      print('Código de estado: ${response.statusCode}');
      print('Cuerpo de la respuesta: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => fromJson(item)).toList();
      } else {
        // Si el código de estado no es 200, lanzamos una excepción con el código de estado
        print('Error: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Excepción capturada: $e');
      throw Exception('Failed to load data');
    }
  }
  // Métodos específicos para obtener los datos

  Future<List<User>> fetchUsers() async {
    return await fetchData('users/', (item) => User.fromJson(item));
  }

  Future<List<PlayerAssignment>> fetchPlayerAssignments() async {
    return await fetchData('player-assignments/', (item) => PlayerAssignment.fromJson(item));
  }

  Future<List<CoachAssignment>> fetchCoachAssignments() async {
    return await fetchData('coach-assignments/', (item) => CoachAssignment.fromJson(item));
  }

  Future<List<Match>> fetchMatches() async {
    return await fetchData('matches/', (item) => Match.fromJson(item));
  }

  Future<List<Planning>> fetchPlannings() async {
    return await fetchData('plannings/', (item) => Planning.fromJson(item));
  }

  Future<List<Squad>> fetchSquads() async {
    return await fetchData('squads/', (item) => Squad.fromJson(item));
  }

  Future<List<Registration>> fetchRegistrations() async {
    return await fetchData('registrations/', (item) => Registration.fromJson(item));
  }

  Future<List<Competence>> fetchCompetences() async {
    return await fetchData('competences/', (item) => Competence.fromJson(item));
  }

  Future<List<RuleCompetition>> fetchRuleCompetences() async {
    return await fetchData('rule-competences/', (item) => RuleCompetition.fromJson(item));
  }

  Future<List<RuleDiscipline>> fetchRuleDisciplines() async {
    return await fetchData('rule-disciplines/', (item) => RuleDiscipline.fromJson(item));
  }

  Future<List<Discipline>> fetchDisciplines() async {
    return await fetchData('disciplines/', (item) => Discipline.fromJson(item));
  }

  Future<List<CompetitionEdition>> fetchCompetitionEditions() async {
    return await fetchData('competence-editions/', (item) => CompetitionEdition.fromJson(item));
  }

  Future<List<Stage>> fetchStages() async {
    return await fetchData('stages/', (item) => Stage.fromJson(item));
  }

  Future<List<Team>> fetchTeams() async {
    return await fetchData('teams/', (item) => Team.fromJson(item));
  }

  Future<List<Locality>> fetchLocalities() async {
    return await fetchData('localities/', (item) => Locality.fromJson(item));
  }

  Future<List<StageCompetition>> fetchStageCompetitions() async {
    return await fetchData('stage-competitions/', (item) => StageCompetition.fromJson(item));
  }

  Future<List<Country>> fetchCountries() async {
    return await fetchData('countries/', (item) => Country.fromJson(item));
  }

  Future<List<Format>> fetchFormats() async {
    return await fetchData('formats/', (item) => Format.fromJson(item));
  }
}
