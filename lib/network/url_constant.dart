import 'package:first_project/app_config.dart';

///网络地址
class UrlConstant {

  ///获取根 URL
  static String getBaseUrl() {
    if (isAppDebug) {
      return baseUrlDev;
    }
    return baseUrl;
  }

  static const String baseUrl = "https://www.wanandroid.com";
  static const String baseUrlDev = "https://www.wanandroid.com";
  static const String articleList = "/article/list/0/json";
}
