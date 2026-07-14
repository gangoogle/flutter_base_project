import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:first_project/api/app_cache.dart';
import 'package:first_project/network/header_interceptor.dart';
import 'package:first_project/network/result_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.statusCode, this.body);

  final int statusCode;
  final Object? body;
  RequestOptions? capturedRequest;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    capturedRequest = options;
    return ResponseBody.fromString(
      body.toString(),
      statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    AppCache.resetForTesting();
  });

  test('result shell is unwrapped and invalid bodies fail', () {
    final interceptor = ResultInterceptor();
    expect(
      interceptor.handleResult({
        'errorCode': 0,
        'data': {'id': 1},
      }),
      {'id': 1},
    );
    expect(
      () => interceptor.handleResult({'errorCode': -1, 'errorMsg': 'bad'}),
      throwsA(isA<FormatException>()),
    );
    expect(() => interceptor.handleResult(null), throwsFormatException);
    expect(() => interceptor.handleResult('not-json'), throwsFormatException);
  });

  test('header interceptor adds only non-empty tokens', () async {
    final adapter = _FakeAdapter(200, '{"ok":true}');
    final dio = Dio()..httpClientAdapter = adapter;
    dio.interceptors.add(HeaderInterceptor());

    await dio.get<dynamic>('https://example.test/empty');
    expect(adapter.capturedRequest!.headers.containsKey('token'), isFalse);

    await AppCache.saveLoginToken('abc');
    await dio.get<dynamic>('https://example.test/token');
    expect(adapter.capturedRequest!.headers['token'], 'abc');
  });

  test('non-2xx response is converted to a readable DioException', () async {
    final adapter = _FakeAdapter(500, '{"errorCode":0,"data":null}');
    final dio = Dio(BaseOptions(validateStatus: (_) => true))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(ResultInterceptor());

    await expectLater(
      dio.get<dynamic>('https://example.test/fail'),
      throwsA(
        isA<DioException>().having(
          (error) => error.message,
          'message',
          contains('HTTP 请求失败'),
        ),
      ),
    );
  });
}
