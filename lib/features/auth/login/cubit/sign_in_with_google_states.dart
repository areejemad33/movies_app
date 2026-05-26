sealed class GoogleAuthState {}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthSuccess extends GoogleAuthState {}

class GoogleAuthError extends GoogleAuthState {
  final String message;
  GoogleAuthError(this.message);
}