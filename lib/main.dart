import 'package:ayurvedic_center/core/constants/routes.dart';
import 'package:ayurvedic_center/features/login/presentation/pages/login_screen.dart';
import 'package:ayurvedic_center/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      builder: (context, child) {
        return SafeArea(bottom: true, top: false, child: child!);
      },
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
      },
    );
  }
}
