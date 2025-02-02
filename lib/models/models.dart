class User {
  String username;
  String email;
  String role;
  DateTime createdAt;

  User({
    required this.username,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Team {
  String name;
  Country country;
  String logo;
  List<Squad> squads;

  Team({
    required this.name,
    required this.country,
    required this.logo,
    required this.squads,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      country: Country.fromJson(json['country']),
      logo: json['logo'],
      squads: (json['squads'] as List).map((i) => Squad.fromJson(i)).toList(),
    );
  }
}

class Squad {
  Planning season;
  Team team;
  List<User> players;
  List<User> coaches;
  List<Registration> registrations;

  Squad({
    required this.season,
    required this.team,
    required this.players,
    required this.coaches,
    required this.registrations,
  });

  factory Squad.fromJson(Map<String, dynamic> json) {
    return Squad(
      season: Planning.fromJson(json['season']),
      team: Team.fromJson(json['team']),
      players: (json['players'] as List).map((i) => User.fromJson(i)).toList(),
      coaches: (json['coaches'] as List).map((i) => User.fromJson(i)).toList(),
      registrations: (json['registrations'] as List).map((i) => Registration.fromJson(i)).toList(),
    );
  }
}

class PlayerAssignment {
  Squad squad;
  User player;

  PlayerAssignment({
    required this.squad,
    required this.player,
  });

  factory PlayerAssignment.fromJson(Map<String, dynamic> json) {
    return PlayerAssignment(
      squad: Squad.fromJson(json['squad']),
      player: User.fromJson(json['player']),
    );
  }
}

class CoachAssignment {
  Squad squad;
  User coach;

  CoachAssignment({
    required this.squad,
    required this.coach,
  });

  factory CoachAssignment.fromJson(Map<String, dynamic> json) {
    return CoachAssignment(
      squad: Squad.fromJson(json['squad']),
      coach: User.fromJson(json['coach']),
    );
  }
}

class Match {
  Squad homeSquad;
  Squad awaySquad;
  int homeGoals;
  int awayGoals;
  DateTime time;
  Locality stadium;
  Stage stage;

  Match({
    required this.homeSquad,
    required this.awaySquad,
    required this.homeGoals,
    required this.awayGoals,
    required this.time,
    required this.stadium,
    required this.stage,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      homeSquad: Squad.fromJson(json['homeSquad']),
      awaySquad: Squad.fromJson(json['awaySquad']),
      homeGoals: json['homeGoals'],
      awayGoals: json['awayGoals'],
      time: DateTime.parse(json['time']),
      stadium: Locality.fromJson(json['stadium']),
      stage: Stage.fromJson(json['stage']),
    );
  }
}

class Locality {
  String stadiumName;
  String streetOne;
  String streetTwo;
  String reference;

  Locality({
    required this.stadiumName,
    required this.streetOne,
    required this.streetTwo,
    required this.reference,
  });

  factory Locality.fromJson(Map<String, dynamic> json) {
    return Locality(
      stadiumName: json['stadiumName'],
      streetOne: json['streetOne'],
      streetTwo: json['streetTwo'],
      reference: json['reference'],
    );
  }
}

class Registration {
  Squad squad;
  String serie;
  CompetitionEdition competencie;

  Registration({
    required this.squad,
    required this.serie,
    required this.competencie,
  });

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      squad: Squad.fromJson(json['squad']),
      serie: json['serie'],
      competencie: CompetitionEdition.fromJson(json['competencie']),
    );
  }
}

class Planning {
  DateTime startDate;
  DateTime endDate;

  Planning({
    required this.startDate,
    required this.endDate,
  });

  factory Planning.fromJson(Map<String, dynamic> json) {
    return Planning(
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}

class Rule {
  int numeration;
  String ruleDescription;
  String actor;
  String action;
  String typeRule;

  Rule({
    required this.numeration,
    required this.ruleDescription,
    required this.actor,
    required this.action,
    required this.typeRule,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      numeration: json['numeration'],
      ruleDescription: json['ruleDescription'],
      actor: json['actor'],
      action: json['action'],
      typeRule: json['typeRule'],
    );
  }
}

class Discipline {
  String name;
  String image;
  String surface;
  String federation;
  String description;

  Discipline({
    required this.name,
    required this.image,
    required this.surface,
    required this.federation,
    required this.description,
  });

  factory Discipline.fromJson(Map<String, dynamic> json) {
    return Discipline(
      name: json['name'],
      image: json['image'],
      surface: json['surface'],
      federation: json['federation'],
      description: json['description'],
    );
  }
}

class Competence {
  String name;
  String description;
  String logo;
  Format? competenceFormat;
  List<RuleCompetition> ruleList; // Se usa `RuleCompetition` para manejar las reglas
  List<RuleDiscipline> ruleDisciplineList; // Aunque está vacío en este caso, aún lo necesitamos en la clase
  Competence({
    required this.name,
    required this.description,
    required this.logo,
    this.competenceFormat,
    required this.ruleList,
    required this.ruleDisciplineList,
  });

  factory Competence.fromJson(Map<String, dynamic> json) {
    return Competence(
      name: json['name'] ?? 'No name', // Si 'name' es null, usamos 'No name' por defecto
      description: json['description'] ?? 'No description', // Default if null
      logo: json['logo'] ?? '', // Si el logo es null o vacío, lo dejamos como string vacío
      competenceFormat: json['competence_format'] != null
          ? Format.fromJson(json['competence_format'])
          : null, // Si 'competence_format' es null, lo dejamos como null
      ruleList: (json['rule_list'] as List)
          .map((rule) => RuleCompetition.fromJson(rule))
          .toList(), // Convertimos las reglas
      ruleDisciplineList: (json['rule_discipline_list'] as List)
          .map((rule) => RuleDiscipline.fromJson(rule))
          .toList(), // Convertimos las reglas de disciplina (aunque esté vacío)
    );
  }
}

class RuleCompetition {
  int id;
  int numeration;
  String ruleDescription;
  String actor;
  String action;
  String typeRule;
  int competence;

  RuleCompetition({
    required this.id,
    required this.numeration,
    required this.ruleDescription,
    required this.actor,
    required this.action,
    required this.typeRule,
    required this.competence,
  });

  factory RuleCompetition.fromJson(Map<String, dynamic> json) {
    return RuleCompetition(
      id: json['id'] ?? 0,
      numeration: json['numeration'] ?? 0,
      ruleDescription: json['rule_description'] ?? '',
      actor: json['actor'] ?? '',
      action: json['action'] ?? '',
      typeRule: json['type_rule'] ?? '',
      competence: json['competence'] ?? 0,
    );
  }
}

class Format {
  // Suponiendo que `Format` es otro modelo que debes definir.
  Format();

  factory Format.fromJson(Map<String, dynamic> json) {
    return Format(); // Ajusta según los campos de `Format`
  }
}


class RuleDiscipline extends Rule {
  Discipline discipline;

  RuleDiscipline({
    required int numeration,
    required String ruleDescription,
    required String actor,
    required String action,
    required String typeRule,
    required this.discipline,
  }) : super(
    numeration: numeration,
    ruleDescription: ruleDescription,
    actor: actor,
    action: action,
    typeRule: typeRule,
  );

  factory RuleDiscipline.fromJson(Map<String, dynamic> json) {
    return RuleDiscipline(
      numeration: json['numeration'],
      ruleDescription: json['ruleDescription'],
      actor: json['actor'],
      action: json['action'],
      typeRule: json['typeRule'],
      discipline: Discipline.fromJson(json['discipline']),
    );
  }
}

class CompetitionEdition {
  User competenceAdmin;
  Planning planning;
  List<Registration> inscriptionList;
  List<CompetitionEdition> subdivisionList;
  List<Stage> stageList;
  Competence competence;

  CompetitionEdition({
    required this.competenceAdmin,
    required this.planning,
    required this.inscriptionList,
    required this.subdivisionList,
    required this.stageList,
    required this.competence,
  });

  factory CompetitionEdition.fromJson(Map<String, dynamic> json) {
    return CompetitionEdition(
      competenceAdmin: User.fromJson(json['competenceAdmin']),
      planning: Planning.fromJson(json['planning']),
      inscriptionList: (json['inscriptionList'] as List).map((i) => Registration.fromJson(i)).toList(),
      subdivisionList: (json['subdivisionList'] as List).map((i) => CompetitionEdition.fromJson(i)).toList(),
      stageList: (json['stageList'] as List).map((i) => Stage.fromJson(i)).toList(),
      competence: Competence.fromJson(json['competence']),
    );
  }
}

class Stage {
  Planning time;

  Stage({
    required this.time,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      time: Planning.fromJson(json['time']),
    );
  }
}

class StageCompetition {
  CompetitionEdition competition;
  Stage stage;

  StageCompetition({
    required this.competition,
    required this.stage,
  });

  factory StageCompetition.fromJson(Map<String, dynamic> json) {
    return StageCompetition(
      competition: CompetitionEdition.fromJson(json['competition']),
      stage: Stage.fromJson(json['stage']),
    );
  }
}

class Country {
  String name;
  String description;

  Country({
    required this.name,
    required this.description,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      description: json['description'],
    );
  }
}
