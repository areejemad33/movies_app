import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/features/Home/domain/use_cases/search_movies_use_case.dart';
import 'package:movies_app/features/Home/presentation/cubit/browse/browse_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/home/home_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/home/home_state.dart';
import 'package:movies_app/features/Home/presentation/cubit/search/search_cubit.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/browse_tab.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/home_tab.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/profile_tab.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/search_tab.dart';
import 'package:movies_app/features/Home/presentation/widgets/bottom_nav.dart';
import 'package:movies_app/features/profile/presentation/cubit/tabs/tabs_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> tabs = [
    const HomeTab(),

    BlocProvider(
      create: (_) => SearchCubit(
        getIt<SearchMoviesUseCase>(),
      ),
      child: const SearchTab(),
    ),

    BlocProvider(
      create: (_) {
        final cubit = getIt<BrowseCubit>();

        cubit.getMoviesByGenre(
          cubit.selectedCategory,
        );

        return cubit;
      },
      child: const BrowseTab(),
    ),

    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TabsCubit(),
        ),
      ],

      child: SafeArea(
        bottom: false,
        child: SafeArea(
          child: Scaffold(
            extendBody: true,

            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return tabs[state.bottomNavIndex];
              },
            ),

            bottomNavigationBar: BottomNav(
              currentIndex:
                  context.watch<HomeCubit>().state.bottomNavIndex,

              onTap: (index) {
                context.read<HomeCubit>().changeBottomNav(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}