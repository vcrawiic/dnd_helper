enum MonsterOrderDirection { ASC, DESC }

enum MonsterOrderBy {
  NAME,
  TYPE,
  SIZE,
  CHALLENGE_RATING,
  STRENGTH,
  DEXTERITY,
  CONSTITUTION,
  INTELLIGENCE,
  WISDOM,
  CHARISMA,
}

class MonsterOrder {
  MonsterOrder({required this.orderDirection, required this.orderBy});

  final MonsterOrderDirection orderDirection;
  final MonsterOrderBy orderBy;
}
