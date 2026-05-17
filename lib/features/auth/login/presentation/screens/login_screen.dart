import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/auth/login/presentation/widgets/login_form.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_language_switch.dart';
import '../widgets/login_with_google_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 19.w,vertical: 8),
            child: Column(
              children: [
                Image.asset(AssetsManager.logo),
                SizedBox(height: 69.h,),
                LoginForm(),
                SizedBox(height: 17.18.h,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, RoutesManager.resetPassword);
                  }, child: Text('Forget Password ?',style: Theme.of(context).textTheme.titleMedium,)),
                ),
                SizedBox(height: 33.26.h,),
                AppButton(text: "Login", onPressed: () {}),
                SizedBox(height: 22.47.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t Have Account ? ',style:Theme.of(context).textTheme.titleSmall ,),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, RoutesManager.register);
                    }, child: Text('Create One',style: Theme.of(context).textTheme.headlineMedium,)),
                  ],
                ),
                SizedBox(height: 27.7.h,),
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
                      child: Text('OR',style: Theme.of(context).textTheme.bodyMedium,),
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
                SizedBox(height: 28.h,),
                     LoginWithGoogleButton(
             text: "Login With Google",
             onPressed: () {},
                     ),
                SizedBox(height: 33.6.h,),
                AppLanguageSwitch(),
          
              ],
            ),
          ),
        ),
      ),
    );


  }
}

