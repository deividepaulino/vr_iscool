import 'package:dio/dio.dart';
import 'package:vr_iscool/core/shared/utils/api.dart';

class CustomDio {
  final Dio dio = Dio();

  CustomDio() {
    dio.options.baseUrl = Api.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.options.sendTimeout = const Duration(seconds: 15);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        request: true,
      ),
    );

    dio.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 500;
    };
  }
}
