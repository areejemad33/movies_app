import 'package:flutter/material.dart';
import 'package:movies_app/features/onboarding/presentation/Models/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/first_onboarding.dart';
import '../../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<OnboardingModel> pages = OnboardingModel.getOnBoarding;

  void _next() async {
    if (_currentIndex == pages.length - 1) {
      // حفظ إن المستخدم شاف الـ Onboarding
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('seen_onboarding', true);

      Navigator.pushReplacementNamed(context, '/login');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentIndex == pages.length - 1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return FirstOnboarding(
              onboardingModel: pages[index],
              onNext: _next,
            );
          } else {
            return OnboardingPage(
              onboardingModel: pages[index],
              onNext: _next,
              onBack: _back,
              title: isLastPage ? 'Finish' : 'Next',
              showBack: index != 1,
            );
          }
        },
      ),
    );
  }
}
