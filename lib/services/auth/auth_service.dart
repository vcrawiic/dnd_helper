import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dnd_helper/services/api/api_client.dart';
import 'package:dnd_helper/services/api/token_storage.dart';
import 'package:dnd_helper/services/auth/authentifible.dart';
import 'package:dnd_helper/services/auth/models/email_auth_request.dart';
import 'package:dnd_helper/services/auth/models/token_pair.dart';

class AuthService implements Authentifible {
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

  @override
  Future<void> checkAuthStatus() async {
    _setAuth(await _tokenStorage.hasTokens());
  }

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) => _authenticate(Endpoint.login, email, password);

  /// register создаёт аккаунт и возвращает `{email, id}` — без токенов.
  /// Поэтому сразу после регистрации логинимся, чтобы получить пару токенов.
  @override
  Future<void> signupWithEmail({
    required String email,
    required String password,
  }) async {
    await _register(email, password);
    await _authenticate(Endpoint.login, email, password);
  }

  Future<void> _register(String email, String password) async {
    try {
      final request = EmailAuthRequest(email: email, password: password);
      await _apiClient.req(Endpoint.register, Method.post, request.toJson());
    } on DioException catch (e, st) {
      log(
        'Register failed [${Endpoint.register.path}] '
        'type=${e.type} status=${e.response?.statusCode} '
        'url=${e.requestOptions.uri} '
        'body=${e.response?.data}',
        name: 'AuthService',
        error: e,
        stackTrace: st,
      );
      throw _errorMessage(e);
    }
  }

  /// login возвращает пару токенов, register — нет (см. [signupWithEmail]).
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
    } on DioException catch (e, st) {
      log(
        'Auth failed [${endpoint.path}] '
        'type=${e.type} status=${e.response?.statusCode} '
        'url=${e.requestOptions.uri} '
        'body=${e.response?.data}',
        name: 'AuthService',
        error: e,
        stackTrace: st,
      );
      throw _errorMessage(e);
    } catch (e, st) {
      // Например, TokenPair.fromJson упал на неожиданном формате ответа.
      log(
        'Auth failed [${endpoint.path}] unexpected error',
        name: 'AuthService',
        error: e,
        stackTrace: st,
      );
      throw 'Authentication failed: $e';
    }
  }

  /// Достаёт человекочитаемое сообщение из ответа, не падая на не-Map теле
  /// (например, HTML-страница 404 приходит строкой).
  String _errorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['error'] != null) return data['error'].toString();
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      return 'Не удалось подключиться к серверу';
    }
    final status = e.response?.statusCode;
    return status != null ? 'Ошибка сервера ($status)' : 'Authentication failed';
  }

  @override
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
