import 'package:dio/dio.dart';

/**
 * 标题拦截器
 */
class HeaderInterceptor {
  Interceptor create() {
    var interceptor = InterceptorsWrapper(
      onRequest: (options, handler) {},
      onResponse: (response, handle) {},
      onError: (error, handle) {},
    );
    return interceptor;
  }
}
