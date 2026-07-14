import 'package:first_project/ui/about/about_view.dart';
import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/list/list_view.dart';
import 'package:first_project/ui/login/login_view.dart';
import 'package:first_project/ui/main/main_home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:first_project/ui/object_box_test/object_box_test_view.dart';
import 'package:first_project/ui/setting/setting_view.dart';
import 'package:get/get.dart';

/// Application routes and their controller lifetimes.
class RouteConfig {
  static const String root = '/';
  static const String home = '/home';
  static const String me = '/me';
  static const String setting = '/setting';
  static const String login = '/login';
  static const String list = '/list';
  static const String objectBoxTest = '/object_test';
  static const String about = "/about";

  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage<void>(name: root, page: () => const MainHomePage()),
      GetPage<void>(name: home, page: HomePage.new),
      GetPage<void>(name: setting, page: SettingPage.new),
      GetPage<void>(name: me, page: MePage.new),
      GetPage<void>(name: login, page: LoginPage.new),
      GetPage<void>(name: list, page: ListPage.new),
      GetPage<void>(name: objectBoxTest, page: ObjectBoxTestPage.new),
      GetPage<void>(name: about, page: AboutPage.new),
    ];
  }
}
