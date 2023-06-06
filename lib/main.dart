import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/feature/navigation_bar/navigation_bar.dart';
import 'package:lingkar_budaya/feature/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lingkar Budaya",
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      home: OnboardingView(),
    );
  }
}
