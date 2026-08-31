  abstract class Authentifible implements AuthentifibleActions, AuthentifibleState {}
  
  abstract interface class AuthentifibleActions {
    Future<void> checkAuthStatus();

    Future<void> signupWithEmail({
      required String email,
      required String password,
    });

    Future<void> signInWithEmail({
      required String email,
      required String password,
    });

    Future<void> signOut();
  }

  abstract interface class AuthentifibleState {
    Stream<bool> get authStateChanges;
  
    bool get isAuthenticated;
  }