import 'package:dio/dio.dart';
import 'package:first_project/network/HeaderInterceptor.dart';

import '../data/bean/article_entity.dart';

class DioApi {
  DioApi();

  static Dio dio = Dio(BaseOptions(
    baseUrl: "https://www.wanandroid.com",
    connectTimeout: Duration(seconds: 60),
  ));

  static void init() {
    dio.interceptors.add(HeaderInterceptor().create());
  }

  static Map<String, dynamic> handleResult(Map<String, dynamic> json) {
    if (json.isEmpty) {
      throw Exception('请求错误');
    }
    var code = json['errorCode'];
    if (code != 0) {
      if (json.containsKey('errorMsg')) {
        throw Exception(json['errorMsg']);
      } else {
        throw Exception('请求错误');
      }
    }
    return json['data'];
  }

  static Future<ArticleData> login(String loginName) async {
    var r = await dio.get("/article/list/0/json");
    return ArticleData.fromJson(handleResult(r.data));
  }
}
