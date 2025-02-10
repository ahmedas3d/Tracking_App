import 'package:flutter/material.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/screens/welcome_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcomeScreen = '/welcomeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
