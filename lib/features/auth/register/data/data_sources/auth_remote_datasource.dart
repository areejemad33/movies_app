

import '../models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({
    required RegisterModel model,
    required String password,
  });
}