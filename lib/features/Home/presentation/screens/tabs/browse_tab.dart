

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/categories.dart';
import 'package:movies_app/features/Home/presentation/cubit/browse/browse_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/browse/browse_state.dart';
import 'package:movies_app/features/Home/presentation/widgets/category_item.dart';
import 'package:movies_app/features/Home/presentation/widgets/movie_card.dart';

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
          SizedBox(
            height: 48.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];

                return CategoryItem(
                  title: category,
                  isSelected: cubit.selectedCategory == category,
                  onTap: () {
                    context
                        .read<BrowseCubit>()
                        .getMoviesByGenre(category);
                  },
                );
              },
              separatorBuilder: (_, __) => SizedBox(width: 8.w),
              itemCount: categories.length,
            ),
          ),

          /// Movies Grid
          Expanded(
            child: BlocBuilder<BrowseCubit, BrowseState>(
              builder: (context, state) {
                if (state is BrowseLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is BrowseLoaded) {
                  return GridView.builder(
                    controller: controller,
                    padding: EdgeInsets.only(
                      top: 16.h,
                      left: 8.w,
                      right: 8.w,
                      bottom: 16.h,
                    ),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: .68,
                    ),
                  itemCount: state.movies.length + (state.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
  if (index >= state.movies.length) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  return MovieCard(movie: state.movies[index]);
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