import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilmsMain(),
              FilmsHeading(),
              SizedBox(height: 31.h),
              FilmCardList(),
            ],
          ),
        ),
      ),
    );
  }
}
