

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/core/widgets/app_language_switch.dart';
import 'package:movies_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:movies_app/features/auth/presentation/login/cubit/login_states.dart';
import 'package:movies_app/features/auth/presentation/login/cubit/sign_in_with_google_cubit.dart';
import 'package:movies_app/features/auth/presentation/login/cubit/sign_in_with_google_states.dart';
import 'package:movies_app/features/auth/presentation/login/widgets/create_acc_section.dart';
import 'package:movies_app/features/auth/presentation/login/widgets/forget_password_button.dart';
import 'package:movies_app/features/auth/presentation/login/widgets/google_login_button.dart';
import 'package:movies_app/features/auth/presentation/login/widgets/login_form.dart';
import 'package:movies_app/features/auth/presentation/login/widgets/login_logo_section.dart';
import 'package:movies_app/features/auth/presentation/login/widgets/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => GoogleAuthCubit(),
        ),
      ],
    child:  MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
               Navigator.pushReplacementNamed(
        context,
        RoutesManager.home,
      );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Successfully Logged In!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigator.pushReplacementNamed(context, RoutesManager.home);
            }
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
        BlocListener<GoogleAuthCubit, GoogleAuthState>(
          listener: (context, state) {
            if (state is GoogleAuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Successfully Logged In With Google!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigator.pushReplacementNamed(context, RoutesManager.home);
            }
            if (state is GoogleAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: REdgeInsets.symmetric(
                        horizontal: 19.w,
                        vertical: 8,
                      ),
                      child:Column(
  children: [
    const LoginLogoSection(),

    LoginForm(
      emailController: _emailController,
      passwordController: _passwordController,
    ),

    SizedBox(height: 17.h),

    const ForgotPasswordButton(),

    SizedBox(height: 33.26.h),

    AppButton(
      text: "Login",
      onPressed: state is LoginLoading
          ? () {}
          : () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                );
              }
            },
    ),

    SizedBox(height: 22.h),

    const CreateAccountSection(),

    SizedBox(height: 27.7.h),

    const OrDivider(),

    SizedBox(height: 28.h),

    const GoogleLoginButton(),

    SizedBox(height: 33.6.h),

    const AppLanguageSwitch(),
  ],
)
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}