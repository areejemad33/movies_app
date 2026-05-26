

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/Home/presentation/cubit/browse/browse_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/browse/browse_state.dart';
import 'package:movies_app/features/Home/presentation/widgets/browse_categories.dart';
import 'package:movies_app/features/Home/presentation/widgets/movie_page_grid.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // initial load
    context.read<BrowseCubit>().getMoviesByGenre("Action");

    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 300) {
        context.read<BrowseCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BrowseCubit>();

    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          SizedBox(height: 16.h),

          /// Categories
        
    CategoriesRow(
      selected: cubit.selectedCategory,
      onTap: (category) {
        context.read<BrowseCubit>().getMoviesByGenre(category);
      },
    ),
          /// Movies Grid
        Expanded(
  child: BlocBuilder<BrowseCubit, BrowseState>(
    builder: (context, state) {
      if (state is BrowseLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is BrowseLoaded) {
        return MoviePagedGrid(
          padding: EdgeInsets.only(
  top: 25.h,
  left: 8.w,
  right: 8.w,
  bottom: 16.h,
),
          movies: state.movies,
          controller: controller,
          isLoadingMore: state.isLoadingMore,
          onLoadMore: () {
            context.read<BrowseCubit>().loadMore();
          },
        );
      }

      return const SizedBox();
    },
  ),
),
        ],
      ),
    );
  }
}