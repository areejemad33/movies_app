import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

import '../cubit/search/search_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return SizedBox(
      height: 56.h,

      child: TextField(
        controller: cubit.searchController,

        onChanged: (value) {
          if (debounce?.isActive ?? false) {
            debounce!.cancel();
          }

          debounce = Timer(const Duration(milliseconds: 500), () {
            cubit.searchMovies(value);
          });
        },

        style: Theme.of(context).textTheme.bodyLarge,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18.h ),

          hintText: "Search",

          hintStyle: Theme.of(context).textTheme.bodyLarge,

          prefixIcon: Padding(
            padding: REdgeInsets.only(left: 20, right: 15),
            child: const ImageIcon(
              AssetImage(AssetsManager.searchIcon),
              size: 24,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: ColorsManager.black, width: 1.w),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: ColorsManager.black, width: 1.w),
          ),
        ),
      ),
    );
  }
}
