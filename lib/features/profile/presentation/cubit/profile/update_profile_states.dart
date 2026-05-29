import 'package:movies_app/features/profile/domain/entities/profile_entity.dart';

sealed class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {}

class DeleteAccountLoading extends UpdateProfileState {}

class DeleteAccountSuccess extends UpdateProfileState {}

class UpdateProfileError extends UpdateProfileState {
  final String message;
  UpdateProfileError(this.message);
}

class LoadProfileLoading extends UpdateProfileState {}

class LoadProfileSuccess extends UpdateProfileState {
  final ProfileEntity user;

  LoadProfileSuccess(this.user);
}