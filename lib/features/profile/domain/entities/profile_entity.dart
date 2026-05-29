class ProfileEntity {
  final String name;
  final String avatarId;
  final int watchListCount;
  final int historyCount;
  final String phone;

  ProfileEntity({
    required this.name,
    required this.avatarId,
    required this.watchListCount,
    required this.historyCount,
    required this.phone
  });
}
