import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'setting_logic.dart';

/// 设置页面
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SettingLogic());
    final state = Get.find<SettingLogic>().state;
    return Scaffold(
      body: Column(
        children: [
          StatusBar(
              color: Colors.blueAccent,
              openStatusPadding: true,
              onBack: () {
                Get.back(result: {'key': "2"});
              }),
          GetBuilder<SettingLogic>(builder: (logic) {
            return Text('last page args -> ${state.argsText}');
          }),
        ],
      ),
    );
  }
}
