import 'package:dio/dio.dart';
import 'package:first_project/api/app_cache.dart';

///请求头拦截器
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //添加token
    var token = await AppCache.getLoginToken();
    if (token.isNotEmpty) {
      options.headers["token"] = token;
    }
    return handler.next(options);
  }
}
