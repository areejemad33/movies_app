import '../../domain/entities/movie_entity.dart';

abstract class BrowseState {}

class BrowseInitial extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseLoaded extends BrowseState {
  final List<MovieEntity> movies;
  final bool isLoadingMore;

  BrowseLoaded(
    this.movies, {
    this.isLoadingMore = false,
  });
}

class BrowseError extends BrowseState {
  final String message;

  BrowseError(this.message);
}