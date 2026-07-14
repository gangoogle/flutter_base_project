import 'package:dio/dio.dart';
import 'package:first_project/network/dio_api.dart';
import 'package:first_project/network/result_interceptor.dart';
import 'package:first_project/network/url_constant.dart';
import '../data/bean/article_entity.dart';

///API服务
class ApiServer {

  static Future<ArticleData> getArticleList() async {
    var r = await DioApi.dio.get(UrlConstant.articleList);
    return ArticleData.fromJson(r.data);
  }

  ///不脱壳演示写法
  static Future<Object> getArticleListUnWrap() async {
    var r = await DioApi.dio.get(UrlConstant.articleList,options: Options(extra: {ResultInterceptor.unwrapResponseKey:false}));
    return r.data;
  }

}
