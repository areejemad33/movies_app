sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final String name;
  final String avatarId;
  final int watchListCount;
  final int historyCount;

  ProfileSuccess({
    required this.name,
    required this.avatarId,
    required this.watchListCount,
    required this.historyCount,
  });
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}