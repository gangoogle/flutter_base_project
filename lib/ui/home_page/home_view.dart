import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomePageLogic());
  final state = Get.find<HomePageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.resetName(),
        child: Icon(Icons.ac_unit),
      ),
      body: Container(
        child: Column(
          children: [
            GetBuilder<HomePageLogic>(
              builder: (logic) {
                return Text('${state.name}');
              },
            ),
            ElevatedButton(
                onPressed: () => {
                      Get.toNamed(GetRouteConfig.SETTING,
                          arguments: {'msg': 'hahaha'})
                    },
                child: const Text("jump to setting page")),
            Obx(() {
              return ElevatedButton(
                  onPressed: () => {logic.addCountObs()},
                  child: Text(state.count.toString()));
            }),
            const Image(
              image: AssetImage("assets/images/android.png"),
              width: 50,
              height: 50,
            ),
            SvgPicture.asset(
              "assets/images/back.svg",
              width: 50,
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => {logic.requestData(context)},
                child: Text('请求网络'))
          ],
        ),
      ),
    );
  }
}
