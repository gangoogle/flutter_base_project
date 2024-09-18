import 'package:dio/dio.dart';

/// 请求结果拦截器
class ResultInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request==>[${options.method}] - PATH:${options.uri}${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final netStatusCode = response.statusCode;
    if (netStatusCode != 200) {
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: '请求失败',
        type: DioExceptionType.badResponse,
        response: response,
      ));
    }
    try {
      //脱壳
      var shellData = handleResult(response.data);
      return handler.resolve(
          Response(requestOptions: response.requestOptions, data: shellData));
    } catch (e) {
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: e.toString(),
        type: DioExceptionType.badResponse,
        response: response,
      ));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  ///处理请求结果
  Map<String, dynamic> handleResult(Map<String, dynamic>? json) {
    print("脱壳==>${json}");
    const successCode = 0;
    if (json == null) {
      throw Exception('请求错误');
    }
    if (json.isEmpty) {
      throw Exception('请求错误');
    }
    var errorCode = json['errorCode'];
    if (errorCode != successCode) {
      if (json.containsKey('errorMsg')) {
        throw Exception(json['errorMsg']);
      } else {
        throw Exception('请求错误');
      }
    }
    print("<==脱壳成功");
    return json['data'];
  }
}
