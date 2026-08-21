import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dnd_helper/services/api/api_client.dart';
import 'package:dnd_helper/services/api/token_storage.dart';
import 'package:dnd_helper/services/auth/models/email_auth_request.dart';
import 'package:dnd_helper/services/auth/models/token_pair.dart';

class AuthService {
  final ApiClient _apiClient;
  final TokenStorage _tokenStorage;
  final _authController = StreamController<bool>.broadcast();

  Stream<bool> get authStateChanges => _authController.stream;

  /// Синхронный снимок состояния входа — для guard в GoRouter (redirect синхронный).
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  AuthService(this._apiClient, this._tokenStorage) {
    // Если refresh не удался — interceptor уже почистил токены и дёрнет этот колбэк.
    _apiClient.onForceLogout = _forceLogout;
  }

  Future<void> checkAuthStatus() async {
    _setAuth(await _tokenStorage.hasTokens());
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) => _authenticate(Endpoint.login, email, password);

  Future<void> signupWithEmail({
    required String email,
    required String password,
  }) => _authenticate(Endpoint.register, email, password);

  /// login и register на новом бэке идентичны: принимают email/password,
  /// возвращают пару токенов. Отличается только endpoint.
  Future<void> _authenticate(
    Endpoint endpoint,
    String email,
    String password,
  ) async {
    try {
      final request = EmailAuthRequest(email: email, password: password);
      final response = await _apiClient.req(endpoint, Method.post, request.toJson());
      final tokens = TokenPair.fromJson(response.data);
      await _tokenStorage.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );
      _setAuth(true);
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'Authentication failed';
    }
  }

  /// Ручной выход пользователя.
  Future<void> signOut() async {
    await _tokenStorage.clearTokens();
    _setAuth(false);
  }

  /// Принудительный выход из interceptor (токены уже почищены там).
  void _forceLogout() => _setAuth(false);

  void _setAuth(bool value) {
    _isAuthenticated = value;
    _authController.add(value);
  }

  void dispose() => _authController.close();
}
