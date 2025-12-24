import 'package:dnd_helper/pages/profile/profile_state.dart';
import 'package:dnd_helper/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthService _authService;

  ProfileCubit(this._authService) : super(ProfileInitial()) {
    _init();
  }

  Future<void> _init() async {
    final user = _authService.currentUser;
    if (user != null) {
      emit(ProfileLoaded(user));
    } else {
      emit(ProfileInitial());
    }
  }

  Future<void> signOut() async {
    try {
      if (!isClosed) {
        emit(ProfileLoading());
      }
      await _authService.signOut();
    } catch (e) {
      if (!isClosed) {
        emit(ProfileError(e.toString()));
      }
    }
  }
}