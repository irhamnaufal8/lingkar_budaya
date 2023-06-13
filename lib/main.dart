import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/data/model/user.dart';
import 'package:lingkar_budaya/common/data/repository/auth_repository.dart';
import 'package:lingkar_budaya/feature/navigation_bar/navigation_bar.dart';
import 'package:lingkar_budaya/feature/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
