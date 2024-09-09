import 'package:first_project/main.dart';
import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../common/status_bar.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logic = Get.put(HomePageLogic());
  final state = Get.find<HomePageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StatusBarPaddingView(color: Colors.blue),
          StatusBar(
            color: Colors.blue,
            onBack: () {
              Get.back();
            },
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(onPressed: () async {
                    var result = await Get.toNamed(GetRouteConfig.SETTING,
                        arguments: {'msg': 'new params-> '});
                    Map<String, String> newResult =
                        result as Map<String, String>;
                    state.argsText.value = newResult["key"] ?? "xx";
                  }, child: Obx(() {
                    return Text("jump to setting page ${state.argsText.value}");
                  })),
                  ElevatedButton(
                      onPressed: () => Get.toNamed(GetRouteConfig.LOGIN,
                          arguments: {'login'}),
                      child: const Text("登录页面")),
                  Obx(() => ElevatedButton(
                      onPressed: () => logic.addCountObs(),
                      child: Text(state.count.toString()))),
                  Obx(() => Text('当前用户名称:${state.userName}')),
                  ElevatedButton(
                      onPressed: () => logic.reSaveUserName(),
                      child: Text("修改用户名称")),
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
                  Container(
                    color: Colors.blueGrey,
                    margin: EdgeInsets.all(10),
                    height: 100,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.co2, color: Colors.orange),
                        Icon(Icons.ac_unit, color: Colors.cyan),
                        Icon(Icons.accessibility_rounded,
                            color: Colors.deepOrange),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          width: 50, height: 30, color: Colors.deepOrange),
                      Container(width: 30, height: 30, color: Colors.green)
                    ],
                  ),
                  Card(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () => {logic.requestData(context)},
                            child: Text('请求网络')),
                        Obx(() {
                          return Text("请求结果:${state.requestResult.value}");
                        })
                      ],
                    ),
                  ),
                  _autoFillParentDivider(),
                  _cardUI(),
                  _cardUI(),
                  _cardUI(),
                  _cardUI(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///卡片布局
  Card _cardUI() {
    return Card(
        color: Colors.teal,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Container(
                  color: Colors.yellow,
                  margin: const EdgeInsets.all(5),
                ),
              )
            ],
          ),
        ));
  }

  //充满父布局的分割线
  IntrinsicHeight _autoFillParentDivider() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.grey,
            ),
          ),
          Container(
            width: 2,
            color: Colors.deepOrange,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
