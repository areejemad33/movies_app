


import 'package:equatable/equatable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

abstract class HomeStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeStates {}

class HomeError extends HomeStates {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class HomeSuccess extends HomeStates {
  final List<MovieEntity> movies;
  final int currentIndex;

   HomeSuccess({
    required this.movies,
    required this.currentIndex,
  });

  @override
  List<Object?> get props => [movies, currentIndex];
}