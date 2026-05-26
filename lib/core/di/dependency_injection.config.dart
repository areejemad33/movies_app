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
    gh.factory<_i708.MovieDetailsRemoteDataSource>(
      () => _i708.MovieDetailsRemoteDataSource(gh<_i784.ApiManager>()),
    );
    gh.factory<_i104.HomeRepository>(
      () => _i755.HomeRepositoryImpl(gh<_i1030.HomeRemoteDataSource>()),
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
    gh.factory<_i860.MovieDetailsCubit>(
      () => _i860.MovieDetailsCubit(
        gh<_i342.GetMovieDetailsUseCase>(),
        gh<_i256.GetSimilarMoviesUseCase>(),
      ),
    );
    return this;
  }
}
