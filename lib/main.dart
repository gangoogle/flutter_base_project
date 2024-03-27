import 'package:first_project/network/dio_api.dart';
import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/main_home/main_home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:first_project/ui/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:first_project/data/database/object_box.dart';

late ObjectBox objectbox;

void main() {
  _initStatusBar();
  _initObjectBox();
  DioApi.init();
  runApp(const MyApp());
}

void _initStatusBar() {
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

void _initObjectBox() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
