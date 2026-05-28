import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/entities/user_entity.dart';
import 'package:movies_app/features/profile/domain/usecases/delete_account_usecase.dart';
import 'package:movies_app/features/profile/domain/usecases/get_user_data_usecase.dart';
import 'package:movies_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:movies_app/features/profile/presentation/cubit/profile/update_profile_states.dart';
@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final GetUserDataUseCase getUser;
  final UpdateProfileUseCase updateProfile;
  final DeleteAccountUseCase deleteAccount;

  UpdateProfileCubit(
    this.getUser,
    this.updateProfile,
    this.deleteAccount,
  ) : super(UpdateProfileInitial());

  Future<void> getUserData() async {
  emit(LoadProfileLoading());

  try {
    final user = await getUser();
    emit(LoadProfileSuccess(user));
  } catch (e) {
    emit(UpdateProfileError(e.toString()));
  }
}

  Future<void> delete() async {
    emit(DeleteAccountLoading());

    try {
      await deleteAccount();
      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
  Future<void> updateProfileData({
  required String name,
  required String phone,
  required String avatarId,
}) async {
  emit(UpdateProfileLoading());

  try {
    await updateProfile(
      UserEntity(
        name: name,
        phone: phone,
        avatarId: avatarId,
      ),
    );

    emit(UpdateProfileSuccess());
  } catch (e) {
    emit(UpdateProfileError(e.toString()));
  }
}
}