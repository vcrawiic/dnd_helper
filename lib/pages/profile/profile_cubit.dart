import 'package:dnd_helper/pages/profile/profile_state.dart';
import 'package:dnd_helper/services/auth/auth_service.dart';
import 'package:dnd_helper/services/profile/profile_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthService _authService;
  final ProfileService _profileService;

  ProfileCubit(this._authService, this._profileService)
    : super(ProfileInitial()) {
    _init();
  }

  Future<void> _init() async {
    try {
      if (!isClosed) emit(ProfileLoading());
      // Берём из кэша, если уже загружен, иначе тянем с /users/me.
      final user =
          _profileService.currentUser ??
          await _profileService.fetchCurrentUser();
      if (!isClosed) emit(ProfileLoaded(user));
    } catch (e) {
      if (!isClosed) emit(ProfileError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      if (!isClosed) emit(ProfileLoading());
      await _authService.signOut();
      _profileService.clear();
    } catch (e) {
      if (!isClosed) emit(ProfileError(e.toString()));
    }
  }
}
