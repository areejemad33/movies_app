import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/core/widgets/app_language_switch.dart';
import 'package:movies_app/features/auth/register/presentation/widgets/already_have_account.dart';
import 'package:movies_app/features/auth/register/presentation/widgets/avatar_selector.dart';
import 'package:movies_app/features/auth/register/presentation/widgets/register_form.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedAvatar = AssetsManager.avatars[0];
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully Registered"),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacementNamed(context, RoutesManager.login);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Register", style: Theme.of(context).textTheme.titleMedium),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AvatarSelector(
                      onAvatarSelected: (avatar) {
                        _selectedAvatar = avatar;
                      },
                    ),
                    SizedBox(height: 10.h),
                    Text("Avatar", style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 12.h),

                    RegisterForm(
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      phoneController: _phoneController,
                    ),

                    SizedBox(height: 24.h),
                    AppButton(
                      text: "Create Account",
                      onPressed: state is RegisterLoading
                          ? () {}
                          : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            name: _nameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            phone: _phoneController.text.trim(),
                            avatar: _selectedAvatar,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 18.h),
                    const AlreadyHaveAccount(),
                    SizedBox(height: 18.h),
                    const AppLanguageSwitch(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}