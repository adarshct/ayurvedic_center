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

  bool isLoading = false;

  Future<void> login() async {
    isLoading = true;
    notifyListeners();

    FormData data = FormData.fromMap({
      'username': emailController.text,
      'password': passwordController.text,
    });
    dynamic resp = await LoginRepository.login(data);

    if (resp is Map<String, dynamic>) {
      if (resp.containsKey('token')) {
        String token = resp['token'];
        await LocalStorage.setData(key: 'access', value: token);

        Navigator.of(AppRouter.context!).pushReplacementNamed(Routes.home);
      } else {
        CustomSnackbar.errorSnackbar();
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
