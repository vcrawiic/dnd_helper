import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:dnd_helper/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial()) {
    _init();
  }
  void _init() {
    _authService.authStateChanges.listen((user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authService.signInWithEmail(email: email, password: password);
    } catch (e) {
      emit(AuthError(e.toString()));
      
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authService.signUpWithEmail(email: email, password: password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
