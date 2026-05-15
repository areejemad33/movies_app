import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/onBoarding/presentation/Models/onboarding_model.dart';
import 'package:movies_app/features/onBoarding/widgets/pop_button.dart';
import 'package:movies_app/features/onBoarding/widgets/push_button.dart';

class OnboardingPage extends StatelessWidget {
 OnboardingPage({super.key, required this.onboardingModel, required this.onNext, required this.onBack , required this.title});

  final OnboardingModel onboardingModel;
  final Function() onNext;
  final Function() onBack;
   final String title;

  @override
  Widget build(BuildContext context) {

    return Stack(
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
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: REdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorsManager.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        onboardingModel.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium,
                      ),
SizedBox(height: 24.h,),
                      Text(
                        textAlign: TextAlign.center,
                        onboardingModel.subTitle!,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelSmall,
                      ),

                      SizedBox(height: 24.h,),
PushButton(title:title, onNext: onNext),
                      SizedBox(height: 16.h,),
PopButton(onBack: onBack),
                    ]
                ),
              ),
            ],
          ),


        ]);
  }
}