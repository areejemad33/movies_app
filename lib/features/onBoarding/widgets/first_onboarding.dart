import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/onBoarding/presentation/Models/onboarding_model.dart';
import 'package:movies_app/features/onBoarding/widgets/push_button.dart';

import '../../../core/resources/colors_manager.dart';

class FirstOnboarding extends StatelessWidget {
 const FirstOnboarding({super.key, required this.onboardingModel, required this.onNext});
  final OnboardingModel onboardingModel;
 final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
        Image.asset(
       onboardingModel.image,
        fit: BoxFit.fill,
      ),
          Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  onboardingModel.color.withOpacity(0.0),
                  onboardingModel.color.withOpacity(0.5),
                  onboardingModel.color.withOpacity(0.91),
                  onboardingModel.color.withOpacity(1.0),

                ],
                stops: const [0.0, 0.5, 0.91, 1.0],
              ),
            ),

          ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.w,vertical: 33.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.center,
                onboardingModel.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 16.h,),
              Text(
                textAlign: TextAlign.center,
                onboardingModel.subTitle!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),


              SizedBox(height: 9.h,),
             PushButton(title: 'Explore Now', onNext: onNext),
            ]
          ),
        ),


        ]),
    );
  }
}
