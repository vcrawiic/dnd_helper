import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dnd_helper/services/api/token_storage.dart';

class TokenRefreshInterceptor extends Interceptor {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final void Function() _onForceLogout;
  final Future<({String at, String rt})> Function(String) _onRefresh;

  Completer<String?>? _refreshCompleter;

  TokenRefreshInterceptor({
    required Dio dio,
    required TokenStorage tokenStorage,
    required void Function() onForceLogout,
    required Future<({String at, String rt})> Function(String) onRefresh,
  }) : _onRefresh = onRefresh,
       _dio = dio,
       _tokenStorage = tokenStorage,
       _onForceLogout = onForceLogout;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final path = err.requestOptions.path;
    if (path.startsWith('/api/auth')) {
      return handler.next(err);
    }

    if (_refreshCompleter != null) {
      final newToken = await _refreshCompleter!.future;
      if (newToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        final retry = await _dio.fetch(err.requestOptions);
        return handler.resolve(retry);
      }
      return handler.next(err);
    }

    _refreshCompleter = Completer<String?>();

    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken == null) {
        _refreshCompleter!.complete(null);
        _onForceLogout();
        return handler.next(err);
      }
      final refreshResult = await _onRefresh(refreshToken);
      await _tokenStorage.saveTokens(
        accessToken: refreshResult.at,
        refreshToken: refreshResult.rt,
      );

      _refreshCompleter!.complete(refreshResult.at);

      err.requestOptions.headers['Authorization'] =
          'Bearer ${refreshResult.at}';
      final retryResponse = await _dio.fetch(err.requestOptions);
      return handler.resolve(retryResponse);
    } on DioException {
      _refreshCompleter!.complete(null);
      await _tokenStorage.clearTokens();
      _onForceLogout();
      return handler.next(err);
    } finally {
      _refreshCompleter = null;
    }
  }
}
