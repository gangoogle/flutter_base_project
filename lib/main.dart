import 'package:first_project/api/api_ext.dart';
import 'package:first_project/network/dio_api.dart';
import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/login/login_view.dart';
import 'package:first_project/ui/main/main_home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:first_project/ui/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui';

// late ObjectBox objectbox;

void main() {
  //如果size是0，则设置回调，在回调中runApp
  if (window.physicalSize.isEmpty) {
    window.onMetricsChanged = () {
      //在回调中，size仍然有可能是0
      if (!window.physicalSize.isEmpty) {
        window.onMetricsChanged = null;
        _run();
      }
    };
  } else {
    _run();
  }
}

void _run() {
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
  // WidgetsFlutterBinding.ensureInitialized();
  // objectbox = await ObjectBox.create();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      getPages: GetRouteConfig.getPages(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainHomePage(),
      routingCallback: (routing) {
        print("更新路由-> ${routing?.current ?? ""}");
        updateStatusBar(routing?.current ?? "");
      },
    );
  }
}

/// 修改状态栏
void updateStatusBar(String route) {
  switch (route) {
    case GetRouteConfig.ROOT:
      setStatusColor(false);
      break;
    case GetRouteConfig.LOGIN:
      setStatusColor(true);
      break;
    case GetRouteConfig.SETTING:
      setStatusColor(false);
      break;
    default:
      setStatusColor(false);
  }
}

/// 路由
class GetRouteConfig {
  static const String ROOT = "/";
  static const String HOME = "/home";
  static const String ME = "/me";
  static const String SETTING = "/setting";
  static const String LOGIN = "/login";

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: ROOT,
        page: () => MainHomePage(),
      ),
      GetPage(name: HOME, page: () => HomePage()),
      GetPage(name: SETTING, page: () => SettingPage()),
      GetPage(name: ME, page: () => MePage()),
      GetPage(name: LOGIN, page: () => LoginPage())
    ];
  }
}
