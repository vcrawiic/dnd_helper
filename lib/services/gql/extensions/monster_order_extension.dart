import 'package:dnd_helper/models/monsters_info/monster_order.dart';
import 'package:dnd_helper/services/gql/schema.graphql.dart';

extension MonsterOrderDirectionMapper on MonsterOrderDirection {
  Enum$OrderByDirection toGraphQL() {
    switch (this) {
      case MonsterOrderDirection.ASC:
        return Enum$OrderByDirection.ASC;
      case MonsterOrderDirection.DESC:
        return Enum$OrderByDirection.DESC;
    }
  }
}

extension MonsterOrderByMapper on MonsterOrderBy {
  Enum$MonsterOrderField toGraphQL() {
    switch (this) {
      case MonsterOrderBy.NAME:
        return Enum$MonsterOrderField.NAME;
      case MonsterOrderBy.CHALLENGE_RATING:
        return Enum$MonsterOrderField.CHALLENGE_RATING;
      case MonsterOrderBy.CHARISMA:
        return Enum$MonsterOrderField.CHARISMA;
      case MonsterOrderBy.CONSTITUTION:
        return Enum$MonsterOrderField.CONSTITUTION;
      case MonsterOrderBy.DEXTERITY:
        return Enum$MonsterOrderField.DEXTERITY;
      case MonsterOrderBy.INTELLIGENCE:
        return Enum$MonsterOrderField.INTELLIGENCE;
      case MonsterOrderBy.SIZE:
        return Enum$MonsterOrderField.SIZE;
      case MonsterOrderBy.STRENGTH:
        return Enum$MonsterOrderField.STRENGTH;
      case MonsterOrderBy.TYPE:
        return Enum$MonsterOrderField.TYPE;
      case MonsterOrderBy.WISDOM:
        return Enum$MonsterOrderField.WISDOM;
    }
  }
}

extension MonsterOrderMapper on MonsterOrder {
  Input$MonsterOrder toGraphQL() {
    return Input$MonsterOrder(
      by: orderBy.toGraphQL(),
      direction: orderDirection.toGraphQL(),
    );
  }
}
