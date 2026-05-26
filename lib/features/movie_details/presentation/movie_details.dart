import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_state.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/cast_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/genere_item.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/info_card.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_header_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/screenshot_heading.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/similar_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/summary_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/watch_button.dart';


class MovieDetails extends StatefulWidget {
  final int movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieDetailsCubit>().getMovieDetails(widget.movieId);
        context.read<MovieDetailsCubit>().getSimilarMovies(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF121312),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(MovieDetailsState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Text(state.error!, style: const TextStyle(color: Colors.white)),
      );
    }

    if (state.movie == null) {
      return const Center(
        child: Text('No Data', style: TextStyle(color: Colors.white)),
      );
    }

    final movie = state.movie!;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            MovieHeaderSection(movie: movie),

            const WatchButton(),

            SizedBox(height: 16.h),

            /// INFO CARDS
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Infocard(
                      icon: AssetsManager.favoritIcon,
                      text: movie.likeCount.toString()
                    ),
                  ),

                  SizedBox(width: 14.w),

                  Expanded(
                    child: Infocard(
                      icon: AssetsManager.watchTime,
                      text: '${movie.runtime}',
                    ),
                  ),

                  SizedBox(width: 14.w),

                  Expanded(
                    child: Infocard(
                      icon: AssetsManager.starIcon,
                      text: movie.rating.toString(),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // / EXTRA CONTENT
            ScreenshotHeading(
  screenshots: movie.screenshots,
),

            SizedBox(height: 12.h),

            /// Similar Section
          SimilarSection(
  movies: state.similarMovies,
),

            /// Summary
            SummarySection(description: movie.description),

            /// Cast
          CastSection(
  cast: movie.cast,
),

            /// Genres
            GenresSection(genres: movie.genres),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
