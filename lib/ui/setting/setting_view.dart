import 'package:first_project/ui/common/base_screen.dart';
import 'package:first_project/ui/common/status_bar.dart';
import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_logic.dart';
import 'setting_logic.dart';

/// 设置页面
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SettingLogic());
    final state = Get.find<SettingLogic>().state;
    return Scaffold(
      body: BasePage(
        child: Container(
          child: Column(
            children: [
              StatusBarPaddingView(
                color: Colors.blueAccent,
              ),
              StatusBar(
                  color: Colors.blueAccent,
                  onBack: () {
                    Get.back(result: {'key': "2"});
                  }),
              Text('setting-page'),
              GetBuilder<SettingLogic>(builder: (logic) {
                return Text('last page args -> ${state.argsText}');
              }),
            ],
          ),
        ),
      ),
    );
  }
}
