import 'package:dnd_helper/pages/char_sheet/models/character_summary.dart';
import 'package:dnd_helper/services/api/api_client.dart';

class CharacterService {
  final ApiClient _apiClient;

  CharacterService(this._apiClient);

  /// Список персонажей текущего пользователя (GET /api/characters).
  Future<List<CharacterSummary>> getCharacters() async {
    final response = await _apiClient.req(
      Endpoint.characters,
      Method.get,
      null,
    );
    final data = (response.data['data'] as List<dynamic>?) ?? const [];
    return data
        .map((e) => CharacterSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Создать нового персонажа с дефолтами (POST /api/characters). Возвращает id.
  Future<int> createCharacter(String name) async {
    final response = await _apiClient.req(Endpoint.characters, Method.post, {
      'name': name,
    });
    return response.data['id'] as int;
  }

  /// Удалить персонажа (DELETE /api/characters/:id).
  Future<void> deleteCharacter(int id) async {
    await _apiClient.req(
      Endpoint.characters,
      Method.delete,
      null,
      pathSuffix: '/$id',
    );
  }
}
