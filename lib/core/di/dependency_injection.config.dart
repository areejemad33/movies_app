// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/core/api/api_manager.dart' as _i784;
import 'package:movies_app/core/di/firebase_module.dart' as _i640;
import 'package:movies_app/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i510;
import 'package:movies_app/features/auth/data/data_sources/auth_remote_data_source_impl.dart'
    as _i3;
import 'package:movies_app/features/auth/data/repositeries_impl/auth_repositery_impl.dart'
    as _i259;
import 'package:movies_app/features/auth/domain/repositeries/auth_repositery.dart'
    as _i250;
import 'package:movies_app/features/auth/domain/usecases/login_use_case.dart'
    as _i158;
import 'package:movies_app/features/auth/domain/usecases/register_usecase.dart'
    as _i3;
import 'package:movies_app/features/auth/domain/usecases/reset_password_use_case.dart'
    as _i992;
import 'package:movies_app/features/auth/presentation/login/cubit/login_cubit.dart'
    as _i803;
import 'package:movies_app/features/auth/presentation/login/cubit/sign_in_with_google_cubit.dart'
    as _i141;
import 'package:movies_app/features/auth/presentation/register/cubit/register_cubit.dart'
    as _i392;
import 'package:movies_app/features/auth/presentation/reset_password/cubit/reset_password_cubit.dart'
    as _i738;
import 'package:movies_app/features/Home/data/data_sources/home_remote_data_source.dart'
    as _i585;
import 'package:movies_app/features/Home/data/data_sources/search_remote_data_source.dart'
    as _i579;
import 'package:movies_app/features/Home/data/repositeries_implementation/home_repository_impl.dart'
    as _i755;
import 'package:movies_app/features/Home/data/repositeries_implementation/search_repository_impl.dart'
    as _i534;
import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart'
    as _i104;
import 'package:movies_app/features/Home/domain/repositiries/search_repository.dart'
    as _i414;
import 'package:movies_app/features/Home/domain/use_cases/get_latest_movies_usecase.dart'
    as _i747;
import 'package:movies_app/features/Home/domain/use_cases/get_random_movies_use_case.dart'
    as _i391;
import 'package:movies_app/features/Home/domain/use_cases/search_movies_use_case.dart'
    as _i214;
import 'package:movies_app/features/Home/presentation/cubit/browse/browse_cubit.dart'
    as _i653;
import 'package:movies_app/features/Home/presentation/cubit/home/home_cubit.dart'
    as _i999;
import 'package:movies_app/features/Home/presentation/cubit/search/search_cubit.dart'
    as _i497;
import 'package:movies_app/features/movie_details/data/movie_details_remote_data_source.dart'
    as _i708;
import 'package:movies_app/features/movie_details/data/repositary_implementation/movie_details_repository_impl.dart'
    as _i310;
import 'package:movies_app/features/movie_details/domain/repositiries/movie_details_repositery.dart'
    as _i525;
import 'package:movies_app/features/movie_details/domain/use_cases/get_similar_movies_usecase.dart'
    as _i256;
import 'package:movies_app/features/movie_details/domain/use_cases/movie_details_usecase.dart'
    as _i342;
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart'
    as _i860;
import 'package:movies_app/features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i1047;
import 'package:movies_app/features/profile/data/data_sources/profile_remote_data_source_impl.dart'
    as _i657;
import 'package:movies_app/features/profile/data/repositeries_impl.dart/profile_repositery_impl.dart'
    as _i132;
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart'
    as _i1056;
import 'package:movies_app/features/profile/domain/usecases/delete_account_usecase.dart'
    as _i24;
import 'package:movies_app/features/profile/domain/usecases/get_profile_usecase.dart'
    as _i131;
import 'package:movies_app/features/profile/domain/usecases/get_user_data_usecase.dart'
    as _i73;
import 'package:movies_app/features/profile/domain/usecases/sign_out_use_case.dart'
    as _i758;
import 'package:movies_app/features/profile/domain/usecases/update_profile_usecase.dart'
    as _i325;
import 'package:movies_app/features/profile/presentation/cubit/profile/profile_cubit.dart'
    as _i101;
import 'package:movies_app/features/profile/presentation/cubit/profile/update_profile_cubit.dart'
    as _i938;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i141.GoogleAuthCubit>(() => _i141.GoogleAuthCubit());
    gh.lazySingleton<_i784.ApiManager>(() => _i784.ApiManager());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.auth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i510.AuthRemoteDataSource>(
      () => _i3.AuthRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i1047.ProfileRemoteDataSource>(
      () => _i657.ProfileRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i1056.ProfileRepository>(
      () => _i132.ProfileRepositoryImpl(gh<_i1047.ProfileRemoteDataSource>()),
    );
    gh.factory<_i585.HomeRemoteDataSource>(
      () => _i585.HomeRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i579.SearchRemoteDataSource>(
      () => _i579.SearchRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i708.MovieDetailsRemoteDataSource>(
      () => _i708.MovieDetailsRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i104.HomeRepository>(
      () => _i755.HomeRepositoryImpl(gh<_i585.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i250.AuthRepository>(
      () => _i259.AuthRepositoryImpl(gh<_i510.AuthRemoteDataSource>()),
    );
    gh.factory<_i414.SearchRepository>(
      () => _i534.SearchRepositoryImpl(gh<_i579.SearchRemoteDataSource>()),
    );
    gh.lazySingleton<_i24.DeleteAccountUseCase>(
      () => _i24.DeleteAccountUseCase(gh<_i1056.ProfileRepository>()),
    );
    gh.lazySingleton<_i73.GetUserDataUseCase>(
      () => _i73.GetUserDataUseCase(gh<_i1056.ProfileRepository>()),
    );
    gh.lazySingleton<_i325.UpdateProfileUseCase>(
      () => _i325.UpdateProfileUseCase(gh<_i1056.ProfileRepository>()),
    );
    gh.factory<_i131.GetProfileUseCase>(
      () => _i131.GetProfileUseCase(gh<_i1056.ProfileRepository>()),
    );
    gh.factory<_i758.SignOutUseCase>(
      () => _i758.SignOutUseCase(gh<_i1056.ProfileRepository>()),
    );
    gh.factory<_i525.MovieDetailsRepositery>(
      () => _i310.MovieDetailsRepositoryImpl(
        gh<_i708.MovieDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i256.GetSimilarMoviesUseCase>(
      () => _i256.GetSimilarMoviesUseCase(gh<_i525.MovieDetailsRepositery>()),
    );
    gh.factory<_i342.GetMovieDetailsUseCase>(
      () => _i342.GetMovieDetailsUseCase(gh<_i525.MovieDetailsRepositery>()),
    );
    gh.factory<_i214.SearchMoviesUseCase>(
      () => _i214.SearchMoviesUseCase(gh<_i414.SearchRepository>()),
    );
    gh.factory<_i497.SearchCubit>(
      () => _i497.SearchCubit(gh<_i214.SearchMoviesUseCase>()),
    );
    gh.factory<_i938.UpdateProfileCubit>(
      () => _i938.UpdateProfileCubit(
        gh<_i73.GetUserDataUseCase>(),
        gh<_i325.UpdateProfileUseCase>(),
        gh<_i24.DeleteAccountUseCase>(),
      ),
    );
    gh.factory<_i747.GetLatestMoviesUseCase>(
      () => _i747.GetLatestMoviesUseCase(gh<_i104.HomeRepository>()),
    );
    gh.factory<_i391.GetMoviesByGenreUseCase>(
      () => _i391.GetMoviesByGenreUseCase(gh<_i104.HomeRepository>()),
    );
    gh.factory<_i992.ResetPasswordUseCase>(
      () => _i992.ResetPasswordUseCase(gh<_i250.AuthRepository>()),
    );
    gh.lazySingleton<_i158.LoginUseCase>(
      () => _i158.LoginUseCase(gh<_i250.AuthRepository>()),
    );
    gh.lazySingleton<_i3.RegisterUseCase>(
      () => _i3.RegisterUseCase(gh<_i250.AuthRepository>()),
    );
    gh.factory<_i101.ProfileCubit>(
      () => _i101.ProfileCubit(
        gh<_i131.GetProfileUseCase>(),
        gh<_i758.SignOutUseCase>(),
      ),
    );
    gh.factory<_i392.RegisterCubit>(
      () => _i392.RegisterCubit(gh<_i3.RegisterUseCase>()),
    );
    gh.factory<_i653.BrowseCubit>(
      () => _i653.BrowseCubit(gh<_i391.GetMoviesByGenreUseCase>()),
    );
    gh.factory<_i999.HomeCubit>(
      () => _i999.HomeCubit(
        gh<_i747.GetLatestMoviesUseCase>(),
        gh<_i391.GetMoviesByGenreUseCase>(),
      ),
    );
    gh.factory<_i860.MovieDetailsCubit>(
      () => _i860.MovieDetailsCubit(
        gh<_i342.GetMovieDetailsUseCase>(),
        gh<_i256.GetSimilarMoviesUseCase>(),
      ),
    );
    gh.factory<_i803.LoginCubit>(
      () => _i803.LoginCubit(gh<_i158.LoginUseCase>()),
    );
    gh.factory<_i738.ResetPasswordCubit>(
      () => _i738.ResetPasswordCubit(gh<_i992.ResetPasswordUseCase>()),
    );
    return this;
  }
}

class _$FirebaseModule extends _i640.FirebaseModule {}
