import 'package:ayurvedic_center/core/constants/app_colors.dart';
import 'package:ayurvedic_center/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CustomSnackbar {
  static void snackbar({
    required String message,
    bool? isSuccess,
    bool? isFailed,
    bool? isExit,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isSuccess == true
          ? AppColors.appGreen
          : isFailed == true
          ? Colors.red
          : Colors.grey[700],
      behavior: SnackBarBehavior.floating,
      action: isExit == true
          ? SnackBarAction(
              label: "Exit",
              textColor: Colors.red,
              onPressed: () {
                SystemNavigator.pop();
              },
            )
          : null,
    );

    ScaffoldMessenger.of(AppRouter.context!).clearSnackBars();

    ScaffoldMessenger.of(AppRouter.context!).showSnackBar(snackBar);
  }

  static void errorSnackbar() {
    snackbar(message: "Something went wrong", isFailed: true);
  }
}
