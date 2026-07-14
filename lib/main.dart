import 'package:first_project/api/api_ext.dart';
import 'package:first_project/network/dio_api.dart';
import 'package:first_project/route_config.dart';
import 'package:first_project/ui/main/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'database/object_box.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initStatusBar();
  await _initObjectBox();
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

Future<void> _initObjectBox() async {
  objectbox = await ObjectBox.create();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Flutter Demo',
        getPages: RouteConfig.getPages(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainHomePage(),
        routingCallback: (routing) {
          updateStatusBar(routing?.current ?? "");
        },
      ),
    );
  }
}

/// 修改状态栏
void updateStatusBar(String route) {
  switch (route) {
    case RouteConfig.ROOT:
      setStatusColor(false);
      break;
    case RouteConfig.LOGIN:
      setStatusColor(true);
      break;
    case RouteConfig.SETTING:
      setStatusColor(false);
      break;
    default:
      setStatusColor(false);
  }
}
