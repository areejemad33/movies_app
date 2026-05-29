import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:movies_app/features/profile/domain/usecases/sign_out_use_case.dart';

import 'profile_states.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {

  final GetProfileUseCase getProfileUseCase;
  final SignOutUseCase signOutUseCase;

  ProfileCubit(
    this.getProfileUseCase,
    this.signOutUseCase,
  ) : super(ProfileInitial());

  Future<void> getProfile() async {

    try {

      emit(ProfileLoading());

      final profile =
          await getProfileUseCase();

      emit(
        ProfileSuccess(
          name: profile.name,
          avatarId: profile.avatarId,
          watchListCount:
              profile.watchListCount,
          historyCount:
              profile.historyCount,
        ),
      );

    } catch (e) {

      emit(
        ProfileError(
          'Something went wrong',
        ),
      );
    }
  }

  Future<void> signOut() async {
    await signOutUseCase();
  }
}