import 'package:equatable/equatable.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movie;
  final bool isLoading;
  final String? error;
  final List<MovieDetailsEntity> similarMovies;

  const MovieDetailsState({this.movie, this.isLoading = false, this.error, this.similarMovies = const [],});

  MovieDetailsState copyWith({
    MovieDetailsEntity? movie,
    bool? isLoading,
    String? error,
    List<MovieDetailsEntity>? similarMovies,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      similarMovies: similarMovies ?? this.similarMovies,
    );
  }

  @override
  List<Object?> get props => [movie, isLoading, error,similarMovies ];
}
