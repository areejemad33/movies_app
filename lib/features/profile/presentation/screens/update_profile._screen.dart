import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/profile/presentation/widgets/delete_dialog.dart';

import '../cubit/profile/update_profile_cubit.dart';
import '../cubit/profile/update_profile_states.dart';

import '../widgets/avatar_bottom_sheet.dart';
import '../widgets/delete_account_button.dart';

import '../widgets/profile_avatar.dart';
import '../widgets/profile_form.dart';
import '../widgets/reset_password_button.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UpdateProfileCubit>()..getUserData(),
      child: const _UpdateProfileView(),
    );
  }
}

class _UpdateProfileView extends StatefulWidget {
  const _UpdateProfileView();

  @override
  State<_UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<_UpdateProfileView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedAvatarId = '0';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {

        /// Load profile success → fill data once only
        if (state is LoadProfileSuccess) {
          _nameController.text = state.user.name;
          _phoneController.text = state.user.phone;
          _selectedAvatarId = state.user.avatarId;
        }

        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context);
        }

        if (state is DeleteAccountSuccess) {
          Navigator.pushReplacementNamed(
            context,
            RoutesManager.login,
          );
        }

        if (state is UpdateProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },

      builder: (context, state) {

        /// 🔥 FULL LOADING SCREEN BEFORE DATA ARRIVES
        if (state is UpdateProfileLoading ||
            state is LoadProfileLoading ||
            state is UpdateProfileInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        /// 🔥 ONLY SHOW UI AFTER DATA IS READY
        if (state is LoadProfileSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Pick Avatar',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            body: Padding(
              padding: REdgeInsets.symmetric(
                vertical: 33.56.h,
                horizontal: 16.w,
              ),

              child: Form(
                key: _formKey,

                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      /// avatar
                      ProfileAvatar(
                        avatarId: _selectedAvatarId,
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => AvatarBottomSheet(
                              selectedAvatarId: _selectedAvatarId,
                              onAvatarSelected: (avatarId) {
                                setState(() {
                                  _selectedAvatarId = avatarId;
                                });
                              },
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 35.h),

                      /// form
                      ProfileForm(
                        nameController: _nameController,
                        phoneController: _phoneController,
                      ),

                      SizedBox(height: 30.h),

                      /// reset password
                      ResetPasswordButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.resetPassword,
                          );
                        },
                      ),

                      SizedBox(height: 220.h),

                      /// delete account
                      DeleteAccountButton(
                        text: 'Delete Account',
                        isLoading: state is DeleteAccountLoading,
                        onPressed: state is DeleteAccountLoading
                            ? () {}
                            : () {
                                showDialog(
                                  context: context,
                                  builder: (_) => DeleteAccountDialog(
                                    onDelete: () {
                                      Navigator.pop(context);
                                      context
                                          .read<UpdateProfileCubit>()
                                          .delete();
                                    },
                                  ),
                                );
                              },
                      ),

                      SizedBox(height: 19.h),

                      /// update button
                      AppButton(
                        text: state is UpdateProfileLoading
                            ? 'Loading...'
                            : 'Update Data',

                        onPressed: state is UpdateProfileLoading
                            ? () {}
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<UpdateProfileCubit>()
                                      .updateProfileData(
                                        name: _nameController.text.trim(),
                                        phone: _phoneController.text.trim(),
                                        avatarId: _selectedAvatarId,
                                      );
                                }
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}