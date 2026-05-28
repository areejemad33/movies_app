import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/features/Home/presentation/widgets/tab_item.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../profile/cubit/profile/profile_cubit.dart';
import '../../../../profile/cubit/profile/profile_states.dart';
import '../../../../profile/cubit/tabs/tabs_cubit.dart';
import '../../../../profile/cubit/tabs/tabs_states.dart';
import '../../../../profile/presentation/widgets/movies_tab.dart';
import '../../widgets/exit_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileCubit()..getProfile()),
        BlocProvider(create: (_) => TabsCubit()),
      ],
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return switch (state) {
              ProfileInitial() => const SizedBox(),
              ProfileLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              ProfileError() => Center(child: Text(state.message)),
              ProfileSuccess() => Column(
                children: [
                  Container(
                    color: ColorsManager.black21,
                    child: Padding(
                      padding: REdgeInsets.only(
                          left: 16, right: 16, top: 52),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    AssetsManager.avatars[
                                    int.parse(state.avatarId)],
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    state.name,
                                    style: GoogleFonts.roboto(
                                      color: ColorsManager.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Text(
                                    '${state.watchListCount}',
                                    style: GoogleFonts.roboto(
                                      color: ColorsManager.white,
                                      fontSize: 36.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Watch List",
                                    style: GoogleFonts.roboto(
                                      color: ColorsManager.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Text(
                                    '${state.historyCount}',
                                    style: GoogleFonts.roboto(
                                      color: ColorsManager.white,
                                      fontSize: 36.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "History",
                                    style: GoogleFonts.roboto(
                                      color: ColorsManager.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 23.h),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: AppButton(
                                  text: 'Edit Profile',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesManager.updateProfile,
                                    ).then((_) {
                                      context.read<ProfileCubit>()
                                          .getProfile();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                flex: 1,
                                child: ExitButton(),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),

                          TabBar(
                            indicatorWeight: 2,
                            indicatorColor: ColorsManager.yellow,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor: ColorsManager.yellow,
                            unselectedLabelColor: Colors.white,
                            tabs: [
                              TabItem(
                                icon: Image.asset(
                                    AssetsManager.watchListIcon),
                                label: "Watch List",
                              ),
                              TabItem(
                                icon: Image.asset(
                                    AssetsManager.historyIcon),
                                label: "History",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        BlocProvider(
                          create: (_) =>
                          TabsCubit()..getWatchList(),
                          child: BlocBuilder<TabsCubit, TabsState>(
                            builder: (context, tabState) {
                              return MoviesTab(
                                isLoading: tabState is TabsLoading,
                                movies: tabState is TabsSuccess
                                    ? tabState.movies
                                    : [],
                              );
                            },
                          ),
                        ),

                        // History Tab
                        BlocProvider(
                          create: (_) =>
                          TabsCubit()..getHistory(),
                          child: BlocBuilder<TabsCubit, TabsState>(
                            builder: (context, tabState) {
                              return MoviesTab(
                                isLoading: tabState is TabsLoading,
                                movies: tabState is TabsSuccess
                                    ? tabState.movies
                                    : [],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}