import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/api/api_ext.dart';
import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../route_config.dart';
import '../common/status_bar.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageLogic logic = Get.put(HomePageLogic());

    return Column(
      children: [
        StatusBarPaddingView(color: "#fff7ff".color),
        StatusBar(
          color: "#fff7ff".color,
          onBack: () {
            Get.back();
          },
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final result = await Get.toNamed(
                        RouteConfig.setting,
                        arguments: {'msg': 'new params-> '},
                      );
                      if (result is Map && result['key'] is String) {
                        logic.argsText.value = result['key'] as String;
                      }
                    },
                    child: Obx(() {
                      return Text("setting page ${logic.argsText.value}");
                    }),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Get.toNamed(RouteConfig.login, arguments: {'login'}),
                    child: const Text("页面"),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(
                      RouteConfig.objectBoxTest,
                      arguments: {'login'},
                    ),
                    child: const Text("objectBox测试"),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(RouteConfig.list),
                    child: const Text("gridViewPage"),
                  ),
                  Obx(
                    () => ElevatedButton(
                      onPressed: () => logic.addCountObs(),
                      child: Text(logic.count.toString()),
                    ),
                  ),
                  Obx(() => Text('当前用户名称:${logic.userName}')),
                  ElevatedButton(
                    onPressed: logic.reSaveUserName,
                    child: const Text("修改用户名称"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/back.svg",
                        width: 50,
                        height: 50,
                      ),
                      const Image(
                        image: AssetImage("assets/images/android.png"),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  Card(
                    color: "#2f2f2f".color,
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.co2, color: Colors.blue),
                          Icon(Icons.ac_unit, color: Colors.cyan),
                          Icon(Icons.sailing, color: Colors.deepOrange),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.deepOrange,
                      ),
                      Container(width: 30, height: 30, color: Colors.green),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => logic.requestData(context),
                              child: const Text('请求网络'),
                            ),
                            Obx(() {
                              return Text("请求结果:${logic.requestResult.value}");
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _autoFillParentDivider(),
                  _cardUI(),
                  _visibleAnim(logic),
                  _visibleAnim(logic),
                  _cacheImg(),
                  _cacheImg2(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _cacheImg2() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CachedNetworkImage(
        imageUrl:
            "https://docs.flutter.cn/assets/images/cn/flutter-cn-logo.png",
      ),
    );
  }

  Widget _cacheImg() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CachedNetworkImage(
        imageUrl:
            "https://img2.baidu.com/it/u=1863038817,1459789936&fm=253&fmt=auto&app=138&f=JPEG?w=542&h=191",
      ),
    );
  }

  //渐隐动画
  Widget _visibleAnim(HomePageLogic logic) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => {logic.buttonVisible.toggle()},
          child: const Text("按钮显示"),
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: AnimatedOpacity(
                  opacity: logic.buttonVisible.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(width: 100, height: 100, color: Colors.red),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                color: logic.buttonVisible.value
                    ? Colors.green
                    : Colors.blueAccent,
                width: logic.buttonVisible.value ? 50 : 100,
                height: logic.buttonVisible.value ? 50 : 100,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                color: logic.buttonVisible.value
                    ? Colors.deepOrangeAccent
                    : Colors.purple,
                width: logic.buttonVisible.value ? 100 : 50,
                height: logic.buttonVisible.value ? 50 : 100,
              ),
            ],
          );
        }),
      ],
    );
  }

  ///卡片布局
  Card _cardUI() {
    return Card(
      color: Colors.teal,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Container(
                color: Colors.yellow,
                margin: const EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //充满父布局的分割线
  IntrinsicHeight _autoFillParentDivider() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(width: 100, height: 50, color: Colors.grey),
          ),
          Container(width: 2, color: Colors.deepOrange),
          Expanded(
            flex: 1,
            child: Container(width: 100, height: 50, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
