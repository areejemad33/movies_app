import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/onboarding/presentation/Models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({
    super.key,
    required this.onboardingModel,
    required this.onNext,
    required this.onBack,
    required this.title,
    required this.showBack,
  });

  final OnboardingModel onboardingModel;
  final Function() onNext;
  final Function() onBack;
  final String title;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [

 Image.asset(
      onboardingModel.image,
      fit: BoxFit.fill,
      alignment: Alignment.topCenter,
    ),

    Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,

        onboardingModel.color.withOpacity(0.4),

        onboardingModel.color.withOpacity(0.75),

        onboardingModel.color.withOpacity(0.95),

        onboardingModel.color,
      ],
      stops: const [0.0, 0.3, 0.6, 0.85, 1.0],
    ),
  ),
),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: REdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: ColorsManager.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child:Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    SizedBox(height: 7.h),

    Text(
      onboardingModel.title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium,
    ),

    if (onboardingModel.subTitle != null &&
        onboardingModel.subTitle!.isNotEmpty) ...[
      SizedBox(height: 8.h),

      Text(
        onboardingModel.subTitle!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    ],

    SizedBox(height: 16.h),

    AppButton(
      text: title,
      onPressed: onNext,
      textStyle: Theme.of(context).textTheme.displayMedium,
    ),

    if (showBack) ...[
      SizedBox(height: 16.h),
  AppButton(
  text: 'Back',
  onPressed: onBack,

  backgroundColor: Colors.transparent,

  borderSide: const BorderSide(
    color: ColorsManager.yellow,
    width: 2,
  ),

  textColor: ColorsManager.yellow,

  textStyle: Theme.of(context).textTheme.displayLarge,
),
    ],
  ],
),
          ),
        ),
      ],
    );
  }
}