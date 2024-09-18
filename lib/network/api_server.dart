import 'package:first_project/network/dio_api.dart';
import 'package:first_project/network/url_constant.dart';
import '../data/bean/article_entity.dart';

///API服务
class ApiServer {
  static Future<ArticleData> getArticleList(String loginName) async {
    var r = await DioApi.dio.get(UrlConstant.articleList);
    return ArticleData.fromJson(r.data);
  }
}
