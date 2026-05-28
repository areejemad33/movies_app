import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';

import '../../../Home/data/models/movie_model.dart';
import '../../../profile/presentation/cubit/tabs/tabs_cubit.dart';
import '../../../profile/presentation/cubit/tabs/tabs_states.dart';

class BookmarkButton extends StatefulWidget {
final MovieDetailsEntity movie;
  const BookmarkButton({
    super.key,
    required this.movie,
  });

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;

  MovieModel get _movieModel => MovieModel(
        id: widget.movie.id,
        title: widget.movie.title,
        image: widget.movie.image,
        rating: widget.movie.rating,
      );

  @override
  void initState() {
    super.initState();

    context.read<TabsCubit>().checkIfBookmarked(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabsCubit, TabsState>(
      listener: (context, state) {
        if (state is WatchListUpdated) {
          setState(() {
            _isBookmarked = state.isBookmarked;
          });
        }

        if (state is TabsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: IconButton(
        onPressed: () async {
          if (_isBookmarked) {
            await context
                .read<TabsCubit>()
                .removeFromWatchList(widget.movie.id);
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
      ),
    );
  }
}