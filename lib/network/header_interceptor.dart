import 'package:dio/dio.dart';
import 'package:first_project/api/app_cache.dart';

class HeaderInterceptor {
  Interceptor create() {
    var interceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        //添加token
        var token = AppCache.getLoginToken();
        if (token.isNotEmpty) {
          options.headers["token"] = token;
        }
      },
      onResponse: (response, handle) {},
      onError: (error, handle) {},
    );
    return interceptor;
  }
}
