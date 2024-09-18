import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/list/list_view.dart';
import 'package:first_project/ui/login/login_view.dart';
import 'package:first_project/ui/main/main_home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:first_project/ui/setting/setting_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

/// 路由
class RouteConfig {
  static const String ROOT = "/";
  static const String HOME = "/home";
  static const String ME = "/me";
  static const String SETTING = "/setting";
  static const String LOGIN = "/login";
  static const String LIST = "/list";

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: ROOT,
        page: () => MainHomePage(),
      ),
      GetPage(name: HOME, page: () => HomePage()),
      GetPage(name: SETTING, page: () => SettingPage()),
      GetPage(name: ME, page: () => MePage()),
      GetPage(name: LOGIN, page: () => LoginPage()),
      GetPage(name: LIST, page: () => ListPage())
    ];
  }
}
