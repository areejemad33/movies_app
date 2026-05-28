import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/info_card.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/watch_button.dart';
import '../../../Home/data/models/movie_model.dart';
import '../../../Home/domain/entities/movie_entity.dart';
import '../../../profile/cubit/tabs/tabs_cubit.dart';
import '../../../profile/cubit/tabs/tabs_states.dart';

class MovieDetails extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetails({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabsCubit()..getWatchList(),
      child: _MovieDetailsView(movie: movie),
    );
  }
}

class _MovieDetailsView extends StatefulWidget {
  final MovieEntity movie;

  const _MovieDetailsView({required this.movie});

  @override
  State<_MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<_MovieDetailsView> {
  bool _isBookmarked = false;

  MovieModel get _movieModel => MovieModel(
    id: widget.movie.id,
    title: widget.movie.title,
    image: widget.movie.image,
    rating: widget.movie.rating,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabsCubit, TabsState>(
      listener: (context, state) {
        if (state is TabsSuccess) {
          setState(() {
            _isBookmarked =
                state.movies.any((m) => m['id'] == widget.movie.id);
          });
        }
        if (state is TabsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorsManager.black,
          body: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.movie.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 645.h,
                placeholder: (context, url) =>
                    Container(color: Colors.black),
                errorWidget: (context, url, error) =>
                    Container(color: Colors.black),
              ),
              Container(
                height: 645.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(18, 19, 18, 0.2),
                      Color(0xFF121312),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          BlocBuilder<TabsCubit, TabsState>(
                            builder: (context, state) {
                              return IconButton(
                                onPressed: state is TabsLoading
                                    ? null
                                    : () async {
                                  if (_isBookmarked) {
                                    await context
                                        .read<TabsCubit>()
                                        .removeFromWatchList(
                                        widget.movie.id);


                                  } else {
                                    await context
                                        .read<TabsCubit>()
                                        .addToWatchList(_movieModel);
                                  }
                                },
                                icon: Icon(
                                  _isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: _isBookmarked
                                      ? ColorsManager.yellow
                                      : Colors.white,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xffF6BD00),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 8),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 250),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        widget.movie.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 30),
                    BlocBuilder<TabsCubit, TabsState>(
                      builder: (context, state) {
                        return WatchButton(
                          onPressed: state is TabsLoading
                              ? null
                              : () async {
                            await context
                                .read<TabsCubit>()
                                .addToHistory(_movieModel);

                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Infocard(
                              icon: AssetsManager.favoritIcon,
                              text: '15',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Infocard(
                            icon: AssetsManager.watchTime,
                            text: '90',
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Infocard(
                              icon: AssetsManager.starIcon,
                              text: widget.movie.rating.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}