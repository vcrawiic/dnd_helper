import 'package:dnd_helper/services/api/api_client.dart';
import 'package:dnd_helper/services/api/token_storage.dart';
import 'package:dnd_helper/services/auth/auth_service.dart';
import 'package:dnd_helper/services/auth/authentifible.dart';
import 'package:dnd_helper/services/character/character_service.dart';
import 'package:dnd_helper/services/dices/dice_roller_service.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:dnd_helper/services/profile/profile_service.dart';
import 'package:dnd_helper/services/storage_service/storage_service.dart';

class GlobalDependencies {
  // Старый публичный D&D API (справочник) — пока оставляем до миграции reference.
  static final GraphQLService graphQLService = GraphQLService(
    'https://www.dnd5eapi.co/graphql/2014',
  );
  static final StorageService storageService = StorageService();
  static final diceRollerService = DiceRollerService();

  // Новый REST-слой (свой Go-бэкенд)
  static final TokenStorage tokenStorage = TokenStorage();
  static final ApiClient apiClient = ApiClient(tokenStorage: tokenStorage);
  static final Authentifible authService = AuthService(apiClient, tokenStorage);
  static final ProfileService profileService = ProfileService(apiClient);
  static final CharacterService characterService = CharacterService(apiClient);
}
