import 'package:dnd_helper/services/gql/graphql_service.dart';

class GlobalDependencies {
  static final GraphQLService graphQLService =
      GraphQLService('https://www.dnd5eapi.co/graphql/2014');
}