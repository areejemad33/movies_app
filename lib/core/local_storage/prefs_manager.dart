import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static const String seenOnboardingKey = 'seen_onboarding';

  static Future<bool> getSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(seenOnboardingKey) ?? false;
  }

  static Future<void> setSeenOnboarding(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(seenOnboardingKey, value);
  }

  static bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}