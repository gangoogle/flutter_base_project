import 'package:dio/dio.dart';
import 'package:first_project/network/url_constant.dart';
import '../data/bean/article_entity.dart';
import 'header_interceptor.dart';

class DioApi {
  DioApi();

  static Dio dio = Dio(BaseOptions(
    baseUrl: UrlConstant.baseUrl,
    connectTimeout: const Duration(seconds: 60),
  ));

  static void init() {
    dio.interceptors.add(HeaderInterceptor().create());
  }
}
