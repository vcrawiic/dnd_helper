import 'dart:async';
import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:dnd_helper/services/auth/authentifible.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final Authentifible _authService;
  StreamSubscription? _authSubscription;

  AuthCubit(this._authService) : super(AuthInitial()) {
    _init();
  }

  void _init() {
    _authSubscription = _authService.authStateChanges.listen((isAuthenticated) {
      if (!isClosed) {
        emit(isAuthenticated ? const Authenticated() : Unauthenticated());
      }
    });
    // Проверяем сохранённые токены при старте — стрим отдаст начальное состояние.
    _authService.checkAuthStatus();
  }

  Future<void> signIn(String email, String password) async {
    try {
      if (!isClosed) {
        emit(AuthLoading());
      }
      await _authService.signInWithEmail(email: email, password: password);
    } catch (e) {
      if (!isClosed) {
        emit(AuthError(e.toString()));
      }
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      if (!isClosed) {
        emit(AuthLoading());
      }
      await _authService.signupWithEmail(email: email, password: password);
    } catch (e) {
      if (!isClosed) {
        emit(AuthError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() async {
    await _authSubscription?.cancel();
    return super.close();
  }
}
