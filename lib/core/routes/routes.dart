import 'package:flutter/material.dart';
import 'package:tracking_app/features/ApplyInApp/presentation/screens/apply_screen.dart';
import 'package:tracking_app/features/ApplyInApp/presentation/screens/apply_successfully.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/screens/forgot_password_screen.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/screens/login_screen.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/screens/email_verification.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/screens/welcome_screen.dart';

class AppRoutes {
  static const String welcomeScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  static const String applyScreen = '/applyScreen';
  static const String applySuccessfully = '/applySuccessfully';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotScreen());
      case applyScreen:
        return MaterialPageRoute(builder: (_) => const ApplyScreen());
      case applySuccessfully:
        return MaterialPageRoute(builder: (_) => const ApplySuccessfully());
      case emailVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => const EmailVerificationScreen());
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
