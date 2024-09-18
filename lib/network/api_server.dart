import 'package:first_project/network/dio_api.dart';
import 'package:first_project/network/result_handle.dart';
import 'package:first_project/network/url_constant.dart';

import '../data/bean/article_entity.dart';

class ApiServer {
  static Future<ArticleData> getArticleList(String loginName) async {
    var r = await DioApi.dio.get(UrlConstant.articleList);
    return ArticleData.fromJson(handleResult(r.data));
  }
}
