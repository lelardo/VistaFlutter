import 'CompetenceClon.dart';
import 'Rule.dart';
import 'CompetenceEditionClon.dart';
import 'PlanningClon.dart';
import 'StageClon.dart';
import 'TeamClone.dart';

class CompetenceClonManager {
  static final CompetenceClonManager _instance = CompetenceClonManager._internal();

  factory CompetenceClonManager() {
    return _instance;
  }

  CompetenceClonManager._internal();

  final List<CompetenceClon> _competences = List.generate(10, (index) {
    return CompetenceClon(
      name: 'Competencia ${index + 1}',
      description: 'Descripción de la competencia ${index + 1}',
      logo: 'https://denomades-blog.imgix.net/blog/wp-content/uploads/2015/07/05162940/p-4.jpg?auto=compress%2Cformat&ixlib=php-3.3.1',
      format: 'Formato ${index + 1}',
      disciplina: 'baseball',
      rules: List.generate(5, (ruleIndex) {
        return Rule(
          numeration: '${ruleIndex + 1}',
          ruleDescription: 'Descripción de la regla chiquita ${ruleIndex + 1}',
          actor: 'Actor ${ruleIndex + 1}',
          action: 'Acción ${ruleIndex + 1}',
          typeRule: 'Tipo de regla ${ruleIndex + 1}',
        );
      }),
      editions: List.generate(3, (editionIndex) {
        return CompetenceEditionClon(
          planning: PlanningClon(
            fechaInicio: DateTime.now().subtract(Duration(days: editionIndex * 365)),
            fechaFin: DateTime.now().subtract(Duration(days: (editionIndex * 365) - 30)),
          ),
          competenceId: index + 1,
          stages: List.generate(2, (stageIndex) {
            return StageClon(
              planning: PlanningClon(
                fechaInicio: DateTime.now().subtract(Duration(days: stageIndex * 30)),
                fechaFin: DateTime.now().subtract(Duration(days: (stageIndex * 30) - 10)),
              ),
            );
          }),
          teams: List.generate(4, (teamIndex) {
            return TeamClone(
              name: 'Team ${teamIndex + 1}',
              country: "saraguro",
              logo: 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
            );
          }),
        );
      }),
    );
  });

  List<CompetenceClon> get competences => _competences;
}