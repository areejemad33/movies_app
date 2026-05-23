
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarCubit extends Cubit<String?> {
  AvatarCubit() : super(null);

  void selectAvatar(String avatar) => emit(avatar);
}