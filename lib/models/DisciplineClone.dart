import 'Rule.dart';

class DisciplineClone {
  final String name;
  final String surface;
  final String federation;
  final List<Rule> rules;

  DisciplineClone({
    required this.name,
    required this.surface,
    required this.federation,
    required this.rules,
  });
}