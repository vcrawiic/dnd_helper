import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dnd_helper/services/api/interceptors/auth_interceptors.dart';
import 'package:dnd_helper/services/api/interceptors/token_refresh_interceptor.dart';
import 'package:dnd_helper/services/api/token_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Endpoint {
  login('/api/auth/login/email'),
  register('/api/auth/register/email'),
  refresh('/api/auth/refresh'),
  userProfile('/api/users/me'),
  characters('/api/characters');

  final String path;
  const Endpoint(this.path);
}

enum Method { get, post, put, patch, delete }

class ApiClient {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  final Dio _dio;
  final TokenStorage _tokenStorage;

  /// Принудительный выход (refresh не удался). Задаётся снаружи после создания — поэтому в interceptor уходит замыкание, а не сам колбэк.
  void Function()? onForceLogout;

  ApiClient({required TokenStorage tokenStorage})
    : _tokenStorage = tokenStorage,
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.interceptors.addAll([
      AuthInterceptor(_tokenStorage),
      TokenRefreshInterceptor(
        dio: _dio,
        tokenStorage: _tokenStorage,
        onForceLogout: () => onForceLogout?.call(),
        onRefresh: _refreshToken,
      ),
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (o) => log(o.toString(), name: 'ApiClient'),
      ),
    ]);
  }

  /// [pathSuffix] дописывается к пути эндпоинта — например '/42' для /api/characters/42.
  Future<Response> req(
    Endpoint endpoint,
    Method method,
    Map<String, dynamic>? data, {
    String pathSuffix = '',
  }) async {
    final path = '${endpoint.path}$pathSuffix';
    switch (method) {
      case Method.get:
        return _dio.get(path, queryParameters: data);
      case Method.post:
        return _dio.post(path, data: data);
      case Method.put:
        return _dio.put(path, data: data);
      case Method.patch:
        return _dio.patch(path, data: data);
      case Method.delete:
        return _dio.delete(path, data: data);
    }
  }

  Future<({String at, String rt})> _refreshToken(String oldToken) async {
    final response = await req(Endpoint.refresh, Method.post, {
      'refresh_token': oldToken,
    });
    final at = response.data['access_token'] as String;
    final rt = response.data['refresh_token'] as String;
    return (at: at, rt: rt);
  }
}
