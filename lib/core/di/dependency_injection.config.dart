// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/core/api/api_manager.dart' as _i784;
import 'package:movies_app/features/Home/data/home_remote_data_source.dart'
    as _i1030;
import 'package:movies_app/features/Home/data/repositeries_implementation/home_repository_impl.dart'
    as _i755;
import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart'
    as _i104;
import 'package:movies_app/features/Home/domain/use_cases/get_latest_movies_usecase.dart'
    as _i747;
import 'package:movies_app/features/Home/domain/use_cases/get_random_movies_use_case.dart'
    as _i391;
import 'package:movies_app/features/Home/presentation/cubit/browse_cubit.dart'
    as _i779;
import 'package:movies_app/features/Home/presentation/cubit/home_cubit.dart'
    as _i224;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i784.ApiManager>(() => _i784.ApiManager());
    gh.factory<_i1030.HomeRemoteDataSource>(
      () => _i1030.HomeRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i104.HomeRepository>(
      () => _i755.HomeRepositoryImpl(gh<_i1030.HomeRemoteDataSource>()),
    );
    gh.factory<_i747.GetLatestMoviesUseCase>(
      () => _i747.GetLatestMoviesUseCase(gh<_i104.HomeRepository>()),
    );
    gh.factory<_i391.GetMoviesByGenreUseCase>(
      () => _i391.GetMoviesByGenreUseCase(gh<_i104.HomeRepository>()),
    );
    gh.factory<_i779.BrowseCubit>(
      () => _i779.BrowseCubit(gh<_i391.GetMoviesByGenreUseCase>()),
    );
    gh.factory<_i224.HomeCubit>(
      () => _i224.HomeCubit(
        gh<_i747.GetLatestMoviesUseCase>(),
        gh<_i391.GetMoviesByGenreUseCase>(),
      ),
    );
    return this;
  }
}
