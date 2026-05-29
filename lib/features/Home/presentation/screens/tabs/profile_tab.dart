import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/features/profile/presentation/widgets/history_tab.dart';
import 'package:movies_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:movies_app/features/profile/presentation/widgets/watch_list_tab.dart';

import '../../../../profile/presentation/cubit/profile/profile_cubit.dart';
import '../../../../profile/presentation/cubit/profile/profile_states.dart';


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (_) => getIt<ProfileCubit>(),
        ),
      ],

      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() =>
      _ProfileViewState();
}

class _ProfileViewState
    extends State<_ProfileView> {

  @override
  void initState() {
    super.initState();

    context
        .read<ProfileCubit>()
        .getProfile();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,

      child: Scaffold(

        body: BlocBuilder<
            ProfileCubit,
            ProfileState>(
          builder: (context, state) {

            return switch (state) {

              ProfileInitial() =>
                  const SizedBox(),

              ProfileLoading() =>
                  const Center(
                    child:
                        CircularProgressIndicator(),
                  ),

              ProfileError() =>
                  Center(
                    child:
                        Text(state.message),
                  ),

              ProfileSuccess() =>
                  Column(
                    children: [

                      ProfileHeader(
                        state: state,
                      ),

                      const Expanded(
                        child: TabBarView(
                          children: [

                            WatchListTab(),

                            HistoryTab(),
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