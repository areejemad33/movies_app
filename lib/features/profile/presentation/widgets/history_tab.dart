import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/profile/presentation/cubit/tabs/tabs_cubit.dart';
import 'package:movies_app/features/profile/presentation/cubit/tabs/tabs_states.dart';
import 'package:movies_app/features/profile/presentation/widgets/movies_tab.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => TabsCubit()..getHistory(),
      child: BlocBuilder<TabsCubit, TabsState>(
        builder: (context, state) {

          return MoviesTab(
            isLoading: state is TabsLoading,
            movies: state is TabsSuccess
                ? state.movies
                : [],
          );
        },
      ),
    );
  }
}