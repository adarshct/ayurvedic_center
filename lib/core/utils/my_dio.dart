import 'dart:convert';
import 'dart:developer';

import 'package:ayurvedic_center/core/constants/api_paths.dart';
import 'package:ayurvedic_center/core/utils/auth.dart';
import 'package:ayurvedic_center/core/widgets/custom_snackbar.dart';
import 'package:dio/dio.dart';

class MyDio {
  late Dio dio;

  MyDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          if (Auth.accessToken.isNotEmpty)
            "Authorization": "Bearer ${Auth.accessToken}",
        },
      ),
    );
  }

  Future<dynamic> get({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response resp = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      printSuccessDetails(resp: resp);
      return jsonDecode(resp.data);
    } on DioException catch (ex) {
      printFailedDetails(ex: ex);

      CustomSnackbar.snackbar(message: ex.type.name, isFailed: true);

      return ex;
    }
  }

  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      if (isFormData) {
        dio.options.headers[Headers.contentTypeHeader] =
            Headers.multipartFormDataContentType;
      }

      Response resp = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      printSuccessDetails(resp: resp);
      return jsonDecode(resp.data);
    } on DioException catch (ex) {
      printFailedDetails(ex: ex);
      CustomSnackbar.snackbar(message: ex.type.name, isFailed: true);
      return ex;
    }
  }

  Future<dynamic> patch({
    required String path,
    required String id,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      if (isFormData) {
        dio.options.headers[Headers.contentTypeHeader] =
            Headers.multipartFormDataContentType;
      }
      Response resp = await dio.patch("$path$id/", data: data);

      printSuccessDetails(resp: resp);
      return jsonDecode(resp.data);
    } on DioException catch (ex) {
      printFailedDetails(ex: ex);
      CustomSnackbar.snackbar(message: ex.type.name, isFailed: true);
      return ex;
    }
  }

  Future<dynamic> delete({required String path, required String id}) async {
    try {
      Response resp = await dio.delete("$path$id/");

      printSuccessDetails(resp: resp);
      return jsonDecode(resp.data);
    } on DioException catch (ex) {
      printFailedDetails(ex: ex);
      CustomSnackbar.snackbar(message: ex.type.name, isFailed: true);
      return ex;
    }
  }

  void printSuccessDetails({required Response resp}) {
    log("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
    log(
      "STATUSCODE[${resp.statusCode}] => PATH: ${resp.requestOptions.baseUrl + resp.requestOptions.path}",
    );
    log("ResMethodType : [${resp.requestOptions.method}]");
    log("Headers: ${resp.requestOptions.headers}");
    log("QueryParameters : ${resp.requestOptions.queryParameters.toString()}");
    log("Body: ${resp.requestOptions.data}");
    if (resp.requestOptions.data is FormData) {
      log("FORMDATA START");
      for (MapEntry<String, String> item in resp.requestOptions.data.fields) {
        log(item.toString());
      }
      for (MapEntry<String, MultipartFile> item
          in resp.requestOptions.data.files) {
        log("$item, Filename : ${item.value.filename}");
      }
      log("FORMDATA END");
    }

    log('resp >>> ${resp.data}');

    log("************** Response End ************************");
  }

  void printFailedDetails({required DioException ex}) {
    log("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
    log(
      "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.baseUrl + ex.requestOptions.path}",
    );
    log("ResMethodType : [${ex.requestOptions.method}]");
    log("Headers: ${ex.requestOptions.headers}");
    log("QueryParameters : ${ex.requestOptions.queryParameters.toString()}");
    log("Body: ${ex.requestOptions.data}");
    if (ex.requestOptions.data is FormData) {
      log("FORMDATA START============================");
      for (MapEntry<String, String> item in ex.requestOptions.data.fields) {
        log(item.toString());
      }
      for (MapEntry<String, MultipartFile> item
          in ex.requestOptions.data.files) {
        log("$item, Filename : ${item.value.filename}");
      }
      log("FORMDATA END============================");
    }

    log("Resp >>> ${ex.response}");
    log('error type >>> ${ex.type}');
    log("EXCEPTION : ${ex.message}");
    log("************** Error End ************************");
  }
}
