import 'Rule.dart';
import 'CompetenceEditionClon.dart';

class CompetenceClon {
  final String name;
  final String description;
  final String logo;
  final String format;
  final String disciplina;
  final List<Rule> rules;
  final List<CompetenceEditionClon> editions; // Lista de ediciones de tipo PlanningClon

  CompetenceClon({
    required this.name,
    required this.description,
    required this.logo,
    required this.format,
    required this.disciplina,
    required this.rules,
    required this.editions, // Asegurarse de que editions sea requerido
  });
}