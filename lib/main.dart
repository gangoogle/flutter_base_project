import 'package:first_project/network/dio_api.dart';
import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/main_home/main_home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:first_project/ui/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DioApi.init();
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: GetRouteConfig.getPages(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainHomePage(),
    );
  }
}

class GetRouteConfig {
  static const String HOME = "/home";
  static const String ME = "/me";
  static const String SETTING = "/setting";

  static List<GetPage> getPages() {
    return [
      GetPage(name: "/", page: () => MainHomePage()),
      GetPage(name: HOME, page: () => HomePage()),
      GetPage(name: SETTING, page: () => SettingPage()),
      GetPage(name: ME, page: () => MePage())
    ];
  }
}
