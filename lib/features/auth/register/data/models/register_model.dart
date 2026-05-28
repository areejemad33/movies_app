import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.avatarId,
  });

  Map<String, dynamic> toMap(String uid) {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'avatarId': avatarId,
      'createdAt': DateTime.now(),
    };
  }
}