import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/utils/validators/auth_validator.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/core/widgets/app_text_form_field.dart';
import '../../cubit/reset_password_cubit.dart';
import '../../cubit/reset_password_states.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: const _ResetPasswordView(),
    );
  }
}

class _ResetPasswordView extends StatefulWidget {
  const _ResetPasswordView();

  @override
  State<_ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<_ResetPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset email sent! Check your inbox.'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
        if (state is ResetPasswordError) {
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
            title: Text(
              'Forget Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AssetsManager.resetPassword),
                    const SizedBox(height: 24),
                    AppTextFormField(
                      controller: _emailController,
                      hintText: "Email",
                      prefixIcon: Image.asset(AssetsManager.emailIcon),
                      keyboardType: TextInputType.emailAddress,
                      validator: AuthValidators.email
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: state is ResetPasswordLoading
                          ? "Loading..."
                          : "Verify Email",
                      onPressed: state is ResetPasswordLoading
                          ? () {}
                          : () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<ResetPasswordCubit>()
                              .resetPassword(
                            email: _emailController.text.trim(),
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
}