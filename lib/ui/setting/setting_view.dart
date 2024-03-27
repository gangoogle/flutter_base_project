import 'package:first_project/ui/common/status_bar.dart';
import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_logic.dart';
import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SettingLogic());
    final state = Get.find<SettingLogic>().state;
    final lastLogic = Get.find<HomePageLogic>();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            StatusBarPaddingView(
              color: Colors.blueAccent,
            ),
            StatusBar(
                color: Colors.blueAccent,
                onBack: () {
                  Get.back();
                }),
            Text('setting page'),
            GetBuilder<SettingLogic>(builder: (logic) {
              return Text('last page args -> ${state.argsText}');
            }),
            ElevatedButton(
                onPressed: () => {lastLogic.resetNameNext()},
                child: Text('给上一个页面传值'))
          ],
        ),
      ),
    );
  }
}
