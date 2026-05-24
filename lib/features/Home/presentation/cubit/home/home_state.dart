import 'package:equatable/equatable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

class HomeState extends Equatable {
  final List<MovieEntity> latestMovies;
  final List<MovieEntity> genreMovies;
  final String selectedGenre;
  final int currentIndex;
  final bool isLoading;
  final String? error;
  final int bottomNavIndex;

  const HomeState({
    this.latestMovies = const [],
    this.genreMovies = const [],
    this.selectedGenre = "Action",
    this.currentIndex = 0,
    this.isLoading = false,
    this.bottomNavIndex = 0,
    this.error,
  });

  HomeState copyWith({
    List<MovieEntity>? latestMovies,
    List<MovieEntity>? genreMovies,
    String? selectedGenre,
    int? currentIndex,
    bool? isLoading,
    String? error,
    int? bottomNavIndex,
  }) {
    return HomeState(
      latestMovies: latestMovies ?? this.latestMovies,
      genreMovies: genreMovies ?? this.genreMovies,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
    );
  }

  @override
  List<Object?> get props => [
    latestMovies,
    genreMovies,
    selectedGenre,
    currentIndex,
    isLoading,
    error,
    bottomNavIndex,
  ];
}
