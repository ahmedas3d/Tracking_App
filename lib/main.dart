import 'package:flutter/material.dart';
import 'package:tracking_app/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcomeScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
