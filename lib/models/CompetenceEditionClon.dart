import 'package:mioconfluter/models/PlanningClon.dart';
import 'package:mioconfluter/models/StageClon.dart';
import 'package:mioconfluter/models/TeamClone.dart';

class CompetenceEditionClon {
  final PlanningClon planning;
  final int competenceId;
  final List<StageClon> stages;
  final List<TeamClone> teams;

  CompetenceEditionClon({
    required this.planning,
    required this.competenceId,
    required this.stages,
    required this.teams,
  });
}