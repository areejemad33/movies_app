import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/Home/presentation/cubit/home_state.dart';
import 'package:movies_app/features/Home/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/browse_tab.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/home_tab.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/profile_tab.dart';
import 'package:movies_app/features/Home/presentation/screens/tabs/search_tab.dart';

import 'package:movies_app/features/Home/presentation/widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
      child: Scaffold(
        
        extendBody: true,
      
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return tabs[state.bottomNavIndex];
          },
        ),
      
        bottomNavigationBar: BottomNav(
          currentIndex: context.watch<HomeCubit>().state.bottomNavIndex,
          onTap: (index) {
            context.read<HomeCubit>().changeBottomNav(index);
          },
        ),
      ),
    );
  }
}