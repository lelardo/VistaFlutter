// DisciplineManager.dart
import 'DisciplineClone.dart';
import 'Rule.dart';

class DisciplineManager {
  static final DisciplineManager _instance = DisciplineManager._internal();

  factory DisciplineManager() {
    return _instance;
  }

  DisciplineManager._internal();

  final List<DisciplineClone> _disciplines = List.generate(5, (index) {
    return DisciplineClone(
      logo: 'https://denomades-blog.imgix.net/blog/wp-content/uploads/2015/07/05162940/p-4.jpg?auto=compress%2Cformat&ixlib=php-3.3.1',
      name: 'Disciplina ${index + 1}',
      surface: 'Superficie ${index + 1}',
      federation: 'Federación ${index + 1}',
      rules: List.generate(3, (ruleIndex) {
        return Rule(
          numeration: '${ruleIndex + 1}',
          ruleDescription: 'Descripción de la reglita ${ruleIndex + 1}',
          actor: 'Actor ${ruleIndex + 1}',
          action: 'Acción ${ruleIndex + 1}',
          typeRule: 'Tipo de regla ${ruleIndex + 1}',
        );
      }),
    );
  });

  List<DisciplineClone> get disciplines => _disciplines;
}