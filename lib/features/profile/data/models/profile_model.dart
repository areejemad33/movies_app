import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {

  ProfileModel({
    required super.name,
    required super.avatarId,
    required super.watchListCount,
    required super.historyCount,
    required super.phone,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {

    return ProfileModel(
      name: json['name'] ?? '',
      avatarId: json['avatarId'] ?? '0',
      watchListCount: json['watchListCount'] ?? 0,
      historyCount: json['historyCount'] ?? 0,
      phone:  json['phone'] ?? ''
    );
  }
}