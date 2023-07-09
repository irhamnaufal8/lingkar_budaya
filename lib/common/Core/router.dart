import 'package:flutter/material.dart';
import 'package:lingkar_budaya/feature/auth/auth_view.dart';
import 'package:lingkar_budaya/feature/home/home_screen.dart';
import 'package:lingkar_budaya/feature/materi/artikel_screen.dart';
import 'package:lingkar_budaya/feature/materi/detail_materi_screen.dart';
import 'package:lingkar_budaya/feature/materi/materi_screen.dart';
import 'package:lingkar_budaya/feature/materi/quiz_screen.dart';
import 'package:lingkar_budaya/feature/navigation_bar/navigation_bar.dart';
import 'package:lingkar_budaya/feature/onboarding/onboarding.dart';
import 'package:lingkar_budaya/feature/profile/edit_profile_screen.dart';
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
  static const editProfile = '/edit_profile';
  // static const artikel = '/artikel';

  static Route<dynamic> generateRoute(RouteSettings settings,
      {Function? onPreviousViewAppear}) {
    switch (settings.name) {
      case login:
        final bool isRegistering = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => LoginScreen(isRegistering: isRegistering),
        );
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case navigationBar:
        return MaterialPageRoute(builder: (_) => const AppNavigationBar());
      case home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(() {
                  currentTab = 1;
                }));
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case testimoni:
        return MaterialPageRoute(builder: (_) => const TestimoniScreen());
      case faq:
        return MaterialPageRoute(builder: (_) => const FAQScreen());
      case detailMateri:
        final DummyMateriData data = settings.arguments as DummyMateriData;
        return MaterialPageRoute(
            builder: (_) => DetailMateriScreen(data: data));
      case quiz:
        final DummyMateriData data = settings.arguments as DummyMateriData;
        return MaterialPageRoute(builder: (_) => QuizScreen(data: data));
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      // case artikel:
      //   return MaterialPageRoute(builder: (_) => const ArtikelScreen());
      default:
        final bool isRegistering = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => LoginScreen(isRegistering: isRegistering),
        );
    }
  }
}

int currentTab = 0;
