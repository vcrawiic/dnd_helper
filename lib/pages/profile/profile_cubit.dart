import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/pages/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
    ProfileCubit() : super(ProfileInitial()) {
      _loadCurrentUser();
    }

    void _loadCurrentUser() {
      final user = GlobalDependencies.authService.currentUser;
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
        await GlobalDependencies.authService.signOut();
      } catch (e) {
        if (!isClosed) {
          emit(ProfileError(e.toString()));
        }
      }
    }
  }