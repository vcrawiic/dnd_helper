
import 'package:dnd_helper/models/classes_info/class_order.dart';
import 'package:dnd_helper/models/classes_info/classes.dart';
import 'package:dnd_helper/models/monsters_info/monster_order.dart';
import 'package:dnd_helper/models/monsters_info/monsters.dart';
import 'package:dnd_helper/services/gql/extensions/class_order_extension.dart';
import 'package:dnd_helper/services/gql/extensions/monster_order_extension.dart';
import 'package:dnd_helper/services/gql/queries/classes.graphql.dart';
import 'package:dnd_helper/services/gql/queries/monsters.graphql.dart';
import 'package:graphql/client.dart';

class GraphQLService {
  late GraphQLClient _client;

  GraphQLService(String url) {
    final httpLink = HttpLink(url);

    _client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  }

  Future<Classes?> fetchClasses(ClassOrder order) async {
    final variables = Variables$Query$Classes(
      order.toGraphQL()
    );

    final res = await _client.query(
      QueryOptions(
        document: documentNodeQueryClasses,
        variables: variables.toJson(),
      ),
    );

    if (res.hasException) {
      throw Exception('GraphQL Error: ${res.exception.toString()}');
    }

    final data = res.data;
    if (data == null) return null;

    Classes classes = Classes.fromJson({"data": data});
    return classes;
  }

  Future<Monsters?> fetchMonsters(MonsterOrder order) async {
    final variables = Variables$Query$Monsters(
      order.toGraphQL()
    );
    final res = await _client.query(QueryOptions(document: documentNodeQueryMonsters, variables: variables.toJson()));

    if (res.hasException) {
      throw Exception('GraphQL Error: ${res.exception.toString()}');
    }

    final data = res.data;
    if (data == null) return null;

    Monsters monsters = Monsters.fromJson({"data": data});
    return monsters;
  }
}

