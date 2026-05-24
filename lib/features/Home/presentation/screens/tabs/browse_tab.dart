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
  State<BrowseTab> createState() =>
      _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseTab> {



  @override
  Widget build(BuildContext context) {
    

final cubit = context.watch<BrowseCubit>();

    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
    
          SizedBox(height: 16.h),
    
          SizedBox(
            height: 48.h,
          
        
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
  horizontal: 16.w,
),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
    
                final category = categories[index];
    
                return CategoryItem(
                  title: category,
                  isSelected:
                      cubit.selectedCategory ==
                          category,
                  onTap: () {
    
                
    
      cubit.getMoviesByGenre(category);
    
    
                  },
                );
              },
              separatorBuilder: (_, __) =>
                  SizedBox(width: 8.w),
              itemCount: categories.length,
            ),
          ),
    
          Expanded(
            child: BlocBuilder<
                BrowseCubit,
                BrowseState>(
              builder: (context, state) {
    
                if (state is BrowseLoading) {
                  return Center(
                    child:
                        CircularProgressIndicator(),
                  );
                }
    
                if (state is BrowseLoaded) {
    
                  return GridView.builder(
                  padding: EdgeInsets.only(
  top: 16.h,
  left: 8.w,
  right: 8.w,
),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
crossAxisSpacing: 20.w,
mainAxisSpacing: 8.h,
childAspectRatio: .68,                    ),

                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
    
                      return MovieCard(
                        movie: state.movies[index],
                      );
                    },
                  );
                }
    
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}