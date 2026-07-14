import 'package:dio/dio.dart';
import 'package:first_project/network/result_interceptor.dart';
import 'package:first_project/network/url_constant.dart';
import 'header_interceptor.dart';

///请求框架
class DioApi {
  DioApi._();

  static bool _initialized = false;

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: UrlConstant.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  static void init() {
    if (_initialized) return;
    dio.interceptors.add(HeaderInterceptor());
    dio.interceptors.add(ResultInterceptor());
    _initialized = true;
  }
}
