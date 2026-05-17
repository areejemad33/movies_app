

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/Home/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/home_state.dart';
import 'package:movies_app/features/Home/presentation/widgets/bottom_nav.dart';
import 'package:movies_app/features/Home/presentation/widgets/film_card_list.dart';
import 'package:movies_app/features/Home/presentation/widgets/films_heading.dart';
import 'package:movies_app/features/Home/presentation/widgets/films_main_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const BottomNav(),

        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {

            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            if (state is HomeSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    FilmsMain(
                      movies: state.movies,
                      currentIndex: state.currentIndex,
                      onPageChanged: (index) {
                        context.read<HomeCubit>().changeIndex(index);
                      },
                    ),

                    const SizedBox(height: 30),

                    const FilmsHeading(),

                    const SizedBox(height: 15),

                    FilmCardList(movies: state.movies),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}