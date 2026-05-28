import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/register/data/data_sources/auth_remote_datasource.dart';
import 'package:movies_app/features/auth/register/domain/repositeries/auth_repositery.dart';

import '../../domain/entities/register_entity.dart';

import '../models/register_model.dart';
@LazySingleton(as: AuthRepository)

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> register({
    required RegisterEntity entity,
    required String password,
  }) {
    final model = RegisterModel(
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      avatarId: entity.avatarId,
    );

    return remoteDataSource.register(
      model: model,
      password: password,
    );
  }
}