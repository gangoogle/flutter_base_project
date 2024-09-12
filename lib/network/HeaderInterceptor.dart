import 'package:dio/dio.dart';

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
