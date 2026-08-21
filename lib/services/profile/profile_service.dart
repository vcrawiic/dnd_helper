import 'package:dnd_helper/services/api/api_client.dart';
import 'package:dnd_helper/services/profile/models/user.dart';

class ProfileService {
  final ApiClient _apiClient;

  User? _currentUser;
  User? get currentUser => _currentUser;

  ProfileService(this._apiClient);

  /// Загружает профиль текущего пользователя (GET /api/users/me) и кэширует его.
  Future<User> fetchCurrentUser() async {
    final response = await _apiClient.req(Endpoint.userProfile, Method.get, null);
    final user = User.fromJson(response.data);
    _currentUser = user;
    return user;
  }

  /// Сбросить кэш профиля (при выходе).
  void clear() => _currentUser = null;
}
