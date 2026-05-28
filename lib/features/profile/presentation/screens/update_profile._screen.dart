import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/profile/presentation/widgets/delete_account_button.dart';
import 'package:movies_app/features/profile/avatar_cubit.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/routes/routes_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../cubit/profile/update_profile_cubit.dart';
import '../../cubit/profile/update_profile_states.dart';
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProfileCubit(),
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
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await context.read<UpdateProfileCubit>().getUserData();
    if (data != null) {
      setState(() {
        _nameController.text = data['name'] ?? '';
        _phoneController.text = data['phone'] ?? '';
        _selectedAvatarId = data['avatarId'] ?? '0';
      });
    }
  }

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
        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
        if (state is DeleteAccountSuccess) {
          Navigator.pushReplacementNamed(context, RoutesManager.login);
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
        return Scaffold(
          appBar: AppBar(
            title: Text('Pick Avatar',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(vertical: 33.56.h, horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => buildAvatarSelector(context),
                      child: Image.asset(
                        AssetsManager.avatars[int.parse(_selectedAvatarId)],
                        width: 150.h,
                        height: 150.h,
                        fit:  BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 35.h),
        
                    AppTextFormField(
                      controller: _nameController,
                      prefixIcon: Image.asset(AssetsManager.profileIcon),
                      hintText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Name is required';
                        return null;
                      },
                    ),
                    SizedBox(height: 19.28.h),
        
                    AppTextFormField(
                      controller: _phoneController,
                      hintText: 'Phone',
                      prefixIcon: Image.asset(AssetsManager.phoneIcon),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Phone is required';
                        if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value))
                          return 'Enter a valid Egyptian phone number';
                        return null;
                      },
                    ),
                    SizedBox(height: 30.28.h),
        
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesManager.resetPassword);
                        },
                        child: Text(
                          'Reset Password',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 220.28.h),
        
                  DeleteAccountButton(
                      text: 'Delete Account',
                      onPressed: state is DeleteAccountLoading
                          ? () {}
                          : () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Delete Account'),
                            content: const Text(
                                'Are you sure you want to delete your account?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context
                                      .read<UpdateProfileCubit>()
                                      .deleteAccount();
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 19.h),
        
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
                              .updateProfile(
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
      },
    );
  }

  void buildAvatarSelector(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => AvatarCubit(),
          child: BlocBuilder<AvatarCubit, String?>(
            builder: (context, selectedAvatar) {
              return Padding(
                padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.black28,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: REdgeInsets.all(19),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: AssetsManager.avatars.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        final bool isSelected =
                            selectedAvatar == AssetsManager.avatars[index];
                        return InkWell(
                          onTap: () {
                            context
                                .read<AvatarCubit>()
                                .selectAvatar(AssetsManager.avatars[index]);
                            setState(() {
                              _selectedAvatarId = index.toString();
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorsManager.yellow,
                                width: isSelected ? 3 : 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: isSelected
                                  ? ColorsManager.yellow.withOpacity(.56)
                                  : ColorsManager.black28,
                            ),
                            child: Image.asset(AssetsManager.avatars[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}


