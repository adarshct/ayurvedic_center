import 'package:ayurvedic_center/core/constants/api_paths.dart';
import 'package:ayurvedic_center/core/utils/my_dio.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  static Future<dynamic> login(FormData data) async {
    dynamic resp = await MyDio().post(
      path: ApiPaths.login,
      data: data,
      isFormData: true,
    );

    return resp;
  }
}
