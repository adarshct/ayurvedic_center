import 'package:ayurvedic_center/core/constants/assets_helper.dart';
import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetsHelper.loginHeader,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        SafeArea(
          child: Image.asset(
            AssetsHelper.logo,
            width: Device.width(context) * 0.2,
          ),
        ),
      ],
    );
  }
}
