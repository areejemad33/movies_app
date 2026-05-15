
import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import '../../../../core/resources/assets_manager.dart';

class OnboardingModel{
 final String image ;
 final String title;
 final String? subTitle;
 final Color color;
 OnboardingModel({required this.image,required this.color,required this.title,this.subTitle = ''});

 
 static List<OnboardingModel> getOnBoarding= [
  
OnboardingModel(image: AssetsManager.onboarding1,
    color: ColorsManager.onboardingBlack,
    title: 'Find Your Next\n Favorite Movie Here',
    subTitle: 'Get access to a huge library of movies \n to suit all tastes. You will surely like it.'),
  OnboardingModel(image: AssetsManager.onboarding2,
      color: ColorsManager.onboardingGreen,
      title: 'Discover Movies',
    subTitle: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.'
  ),
  OnboardingModel(image: AssetsManager.onboarding3,
      color: ColorsManager.onboardingRed,
      title: 'Explore All Genres',
  subTitle: 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.'
  ),
  OnboardingModel(image: AssetsManager.onboarding4,
      color: ColorsManager.onboardingPurple,
      title: 'Create Watchlists',
  subTitle: 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.'
  ),
  OnboardingModel(image: AssetsManager.onboarding5,
      color: ColorsManager.onboardingDarkRed,
      title: 'Rate, Review, and Learn',
  subTitle: "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews."
  ),
  OnboardingModel(image: AssetsManager.onboarding6,
 color: ColorsManager.onboardingGrey,
 title: 'Start Watching Now',
  )
 ];
}