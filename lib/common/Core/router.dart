import 'package:flutter/material.dart';
import 'package:lingkar_budaya/feature/auth/auth_view.dart';
import 'package:lingkar_budaya/feature/home/home_screen.dart';
import 'package:lingkar_budaya/feature/materi/detail_materi_screen.dart';
import 'package:lingkar_budaya/feature/materi/materi_screen.dart';
import 'package:lingkar_budaya/feature/materi/quiz_screen.dart';
import 'package:lingkar_budaya/feature/navigation_bar/navigation_bar.dart';
import 'package:lingkar_budaya/feature/onboarding/onboarding.dart';
import 'package:lingkar_budaya/feature/profile/faq_screen.dart';
import 'package:lingkar_budaya/feature/profile/profile_screen.dart';
import 'package:lingkar_budaya/feature/testimoni/testimoni_screen.dart';

class AppRouter {
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const navigationBar = '/navigation-bar';
  static const home = '/home';
  static const profile = '/profile';
  static const testimoni = '/testimoni';
  static const faq = '/faq';
  static const detailMateri = '/detail_materi';
  static const quiz = '/quiz';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        final bool isRegistering = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => LoginScreen(isRegistering: isRegistering),
        );
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case navigationBar:
        return MaterialPageRoute(builder: (_) => AppNavigationBar());
      case home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(() {
                  currentTab = 1;
                }));
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case testimoni:
        return MaterialPageRoute(builder: (_) => TestimoniScreen());
      case faq:
        return MaterialPageRoute(builder: (_) => FAQScreen());
      case detailMateri:
        final DummyMateriData data = settings.arguments as DummyMateriData;
        return MaterialPageRoute(
            builder: (_) => DetailMateriScreen(data: data));
      case quiz:
        final DummyMateriData data = settings.arguments as DummyMateriData;
        return MaterialPageRoute(builder: (_) => QuizScreen(data: data));
      default:
        final bool isRegistering = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => LoginScreen(isRegistering: isRegistering),
        );
    }
  }
}

int currentTab = 0;
bool isLoggedIn = false;
