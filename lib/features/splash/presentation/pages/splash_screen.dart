import 'package:ayurvedic_center/core/constants/assets_helper.dart';
import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:ayurvedic_center/features/splash/presentation/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => SplashProvider(context),
      child: Scaffold(
        body: Image.asset(
          AssetsHelper.splashBG,
          width: Device.width(context),
          height: Device.height(context),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
