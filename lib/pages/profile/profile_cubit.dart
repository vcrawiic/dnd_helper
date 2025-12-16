import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/pages/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
    ProfileCubit() : super(ProfileInitial()) {
      _init();
    }

    void _init() {
      GlobalDependencies.authService.authStateChanges.listen((user) {
        if (user != null) {
          emit(ProfileLoaded(user));
        } else {
          emit(ProfileInitial());
        }
      });
    }

    Future<void> signOut() async {
      try {
        emit(ProfileLoading());
        await GlobalDependencies.authService.signOut();
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    }
  }