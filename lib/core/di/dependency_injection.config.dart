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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i784.ApiManager>(() => _i784.ApiManager());
    gh.factory<_i585.HomeRemoteDataSource>(
      () => _i585.HomeRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i579.SearchRemoteDataSource>(
      () => _i579.SearchRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i104.HomeRepository>(
      () => _i755.HomeRepositoryImpl(gh<_i585.HomeRemoteDataSource>()),
    );
    gh.factory<_i414.SearchRepository>(
      () => _i534.SearchRepositoryImpl(gh<_i579.SearchRemoteDataSource>()),
    );
    gh.factory<_i214.SearchMoviesUseCase>(
      () => _i214.SearchMoviesUseCase(gh<_i414.SearchRepository>()),
    );
    gh.factory<_i497.SearchCubit>(
      () => _i497.SearchCubit(gh<_i214.SearchMoviesUseCase>()),
    );
    gh.factory<_i747.GetLatestMoviesUseCase>(
      () => _i747.GetLatestMoviesUseCase(gh<_i104.HomeRepository>()),
    );
    gh.factory<_i391.GetMoviesByGenreUseCase>(
      () => _i391.GetMoviesByGenreUseCase(gh<_i104.HomeRepository>()),
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
    return this;
  }
}
