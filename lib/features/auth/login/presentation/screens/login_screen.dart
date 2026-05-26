import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/auth/login/presentation/widgets/login_form.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_language_switch.dart';
import '../../cubit/login_states.dart';
import '../../cubit/sign_in_with_google_cubit.dart';
import '../../cubit/sign_in_with_google_states.dart';
import '../widgets/login_with_google_button.dart';
import '../../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => GoogleAuthCubit()),
      ],
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
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

    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
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
            child: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 19.w, vertical: 8),
                    child: Column(
                      children: [
                        Image.asset(AssetsManager.logo),
                        SizedBox(height: 69.h),
                        LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,

                        ),
                        SizedBox(height: 17.18.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutesManager.resetPassword);
                            },
                            child: Text(
                              'Forget Password ?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
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
                        SizedBox(height: 22.47.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t Have Account ? ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RoutesManager.register);
                              },
                              child: Text(
                                'Create One',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27.7.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Divider(
                                color: ColorsManager.yellow,
                                thickness: 3.h,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'OR',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Divider(
                                color: ColorsManager.yellow,
                                thickness: 3.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
                          builder: (context, googleState) {
                            return LoginWithGoogleButton(
                              text: "Login With Google",
                              isLoading: googleState is GoogleAuthLoading,
                              onPressed: () {
                                context
                                    .read<GoogleAuthCubit>()
                                    .signInWithGoogle();
                              },
                            );
                          },
                        ),
                        SizedBox(height: 33.6.h),
                        AppLanguageSwitch(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}