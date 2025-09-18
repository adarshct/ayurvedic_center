import 'package:ayurvedic_center/core/constants/routes.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  final BuildContext context;
  SplashProvider(this.context) {
    _startTimer();
  }

  void _startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, Routes.login);
  }
}
