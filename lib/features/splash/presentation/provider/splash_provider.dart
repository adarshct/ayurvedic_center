import 'package:ayurvedic_center/core/constants/routes.dart';
import 'package:ayurvedic_center/core/utils/auth.dart';
import 'package:ayurvedic_center/core/utils/local_storage.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  final BuildContext context;
  SplashProvider(this.context) {
    _startTimer();
  }

  void _startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigate();
  }

  void _navigate() {
    print("TOKEEEEEEEEEEEN: ${LocalStorage.getData(key: 'token')}");
    Navigator.pushReplacementNamed(
      context,
      Auth.accessToken.isNotEmpty ? Routes.home : Routes.login,
    );
  }
}
