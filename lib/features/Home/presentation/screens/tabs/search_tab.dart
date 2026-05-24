import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/features/Home/presentation/cubit/search/search_cubit.dart';
import 'package:movies_app/features/Home/presentation/cubit/search/search_state.dart';
import 'package:movies_app/features/Home/presentation/widgets/search_grid.dart';
import 'package:movies_app/features/Home/presentation/widgets/search_text_field.dart';



class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    setupScrollController();
  }

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController
                  .position.maxScrollExtent -
              300) {
        context
            .read<SearchCubit>()
            .loadMoreMovies();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 21.h,
        left: 16.w,
        right: 16.w,
      ),
      child: Column(
        children: [
          const SearchTextField(),

          SizedBox(height: 12.h),

          Expanded(
            child:
                BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                final cubit =
                    context.read<SearchCubit>();

                if (cubit
                    .searchController.text.isEmpty) {
                  return Center(
      child: Image.asset(
        AssetsManager.emptySearch,
        width: 124.w,
      ),
    );
                }

                if (state is SearchLoading &&
                    cubit.movies.isEmpty) {
                  return const Center(
                    child:
                        CircularProgressIndicator(),
                  );
                }

                if (state is SearchError) {
                  return Center(
                    child: Text(
                      state.message,
                    ),
                  );
                }
                if (cubit.movies.isEmpty) {
  return Center(
    child: Text(
      "No Movies Found",
      style: Theme.of(context)
          .textTheme
          .bodyLarge,
    ),
  );
}

                return SearchGrid(
                  movies: cubit.movies,
                  scrollController:
                      scrollController,
                  isLoadingMore:
                      state
                          is SearchPaginationLoading,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}