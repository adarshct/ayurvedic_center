import 'package:ayurvedic_center/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.textSize,
    required this.text,
  });

  final void Function()? onPressed;
  final double? width;
  final double? height;
  final String text;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.52),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize ?? 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
