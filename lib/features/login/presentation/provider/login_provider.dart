import 'package:ayurvedic_center/core/constants/routes.dart';
import 'package:ayurvedic_center/core/utils/app_router.dart';
import 'package:ayurvedic_center/core/utils/local_storage.dart';
import 'package:ayurvedic_center/core/widgets/custom_snackbar.dart';
import 'package:ayurvedic_center/features/login/data/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController(text: "test_user");
  final passwordController = TextEditingController(text: "12345678");

  Future<void> login() async {
    FormData data = FormData.fromMap({
      'username': emailController.text,
      'password': passwordController.text,
    });
    dynamic resp = await LoginRepository.login(data);

    if (resp is Map) {
      if (resp.containsKey('token')) {
        await LocalStorage.setData(key: 'token', value: resp['token']);

        Navigator.of(AppRouter.context!).pushReplacementNamed(Routes.home);
      } else {
        CustomSnackbar.errorSnackbar();
      }
    }
  }
}
