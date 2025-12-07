import 'package:dnd_helper/models/classes/class_order.dart';
import 'package:dnd_helper/services/gql/schema.graphql.dart';

extension ClassOrderDirectionMapper on ClassOrderDirection {
  Enum$OrderByDirection toGraphQL() {
    switch (this) {
      case ClassOrderDirection.ASC:
        return Enum$OrderByDirection.ASC;
      case ClassOrderDirection.DESC:
        return Enum$OrderByDirection.DESC;
    }
  }
}

extension ClassOrderByMapper on ClassOrderBy {
  Enum$ClassOrderField toGraphQL() {
    switch (this) {
      case ClassOrderBy.NAME:
        return Enum$ClassOrderField.NAME;

      case ClassOrderBy.HIT_DIE:
        return Enum$ClassOrderField.HIT_DIE;
    }
  }
}

extension ClassOrderMapper on ClassOrder {
  Input$ClassOrder toGraphQL() {
    return Input$ClassOrder(
      by: orderBy.toGraphQL(),
      direction: orderDirection.toGraphQL(),
    );
  }
}
