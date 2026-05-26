import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/onboarding/presentation/Models/onboarding_model.dart';


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
        fit: BoxFit.cover,
      ),
        
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.w,vertical: 33.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.center,
                onboardingModel.title ,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 16.h,),
              Text(
                textAlign: TextAlign.center,
                onboardingModel.subTitle!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),


              SizedBox(height: 24.h,),
             AppButton(text: 'Explore Now', onPressed: onNext , textStyle: Theme.of(context).textTheme.displayMedium,),
            ]
          ),
        ),


        ]),
    );
  }
}