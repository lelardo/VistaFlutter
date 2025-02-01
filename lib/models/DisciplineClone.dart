import 'Rule.dart';

class DisciplineClone {
  final String logo;
  final String name;
  final String surface;
  final String federation;
  final List<Rule> rules;

  DisciplineClone({
    required this.logo,
    required this.name,
    required this.surface,
    required this.federation,
    required this.rules,
  });
}