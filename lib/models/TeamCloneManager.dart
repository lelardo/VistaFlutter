import 'TeamClone.dart';
import 'SquadClon.dart';
import 'PlanningClon.dart';

class TeamCloneManager {
  static final TeamCloneManager _instance = TeamCloneManager._internal();

  factory TeamCloneManager() {
    return _instance;
  }

  TeamCloneManager._internal();

  final List<TeamClone> _teams = List.generate(10, (index) {
    return TeamClone(
      name: 'Team ${index + 1}',
      logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Rhamphorhynchus_DB.jpg/250px-Rhamphorhynchus_DB.jpg',
      country: 'Country ${index + 1}',
      squads: List.generate(2, (squadIndex) {
        return Squadclon(
          footballSeason: PlanningClon(
            fechaInicio: DateTime.now().subtract(Duration(days: squadIndex * 365)),
            fechaFin: DateTime.now().subtract(Duration(days: (squadIndex * 365) - 30)),
          ),
        );
      }),
    );
  });

  List<TeamClone> get teams => _teams;
}