import 'package:dio/dio.dart';

import '../api/api_ext.dart';

/// Validates HTTP responses and unwraps the API's errorCode/errorMsg/data shell.
class ResultInterceptor extends InterceptorsWrapper {
  static const String unwrapResponseKey = 'unwrapResponse';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint('Request [${options.method}] ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final statusCode = response.statusCode;
    if (statusCode == null || statusCode < 200 || statusCode >= 300) {
      handler.reject(_responseError(response, 'HTTP 请求失败 ($statusCode)'));
      return;
    }

    final shouldUnwrap =
        response.requestOptions.extra[unwrapResponseKey] != false;
    if (!shouldUnwrap) {
      handler.next(response);
      return;
    }

    try {
      final data = handleResult(response.data);
      handler.resolve(
        Response<dynamic>(
          requestOptions: response.requestOptions,
          data: data,
          headers: response.headers,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          redirects: response.redirects,
          extra: response.extra,
        ),
      );
    } on FormatException catch (error) {
      handler.reject(_responseError(response, error.message, error));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logPrint(
      'Request failed [${err.requestOptions.method}] '
      '${err.requestOptions.uri}: ${err.message ?? err.error}',
    );
    handler.next(err);
  }

  Object? handleResult(Object? body) {
    if (body is! Map<String, dynamic>) {
      throw const FormatException('响应格式错误：预期 JSON 对象');
    }
    if (body.isEmpty) {
      throw const FormatException('响应内容为空');
    }
    if (body['errorCode'] != 0) {
      final message = body['errorMsg'];
      throw FormatException(
        message is String && message.isNotEmpty ? message : '请求失败',
      );
    }
    return body['data'];
  }

  DioException _responseError(
    Response<dynamic> response,
    String message, [
    Object? cause,
  ]) {
    final request = response.requestOptions;
    return DioException(
      requestOptions: request,
      response: response,
      type: DioExceptionType.badResponse,
      error: cause ?? message,
      message: '${request.method} ${request.uri}: $message',
    );
  }
}
