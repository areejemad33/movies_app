



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/Home/presentation/cubit/home/home_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/home/home_state.dart';
import 'package:movies_app/features/Home/presentation/widgets/film_card_list.dart';
import 'package:movies_app/features/Home/presentation/widgets/films_heading.dart';
import 'package:movies_app/features/Home/presentation/widgets/films_main_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
    
       body:
    
    BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
    
        if (state.isLoading && state.latestMovies.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    
        if (state.error != null) {
          return Center(
            child: Text(state.error!),
          );
        }
    
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
    
              FilmsMain(
                movies: state.latestMovies,
                currentIndex: state.currentIndex,
                onPageChanged: (index) {
                  context.read<HomeCubit>().changeIndex(index);
                },
              ),
    
              SizedBox(height: 5.h),
    
              FilmsHeading(
                title: state.selectedGenre,
              ),
    
              SizedBox(height: 15.h),
    
              FilmCardList(
                movies: state.genreMovies,
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}