import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'setting_logic.dart';

/// 设置页面
class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {
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
          _switcherSameContainerAnim(),
          _switcherNotSameContainerAnim()
        ],
      ),
    );
  }

  Widget _switcherSameContainerAnim() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              state.animSwitchButton.value = !state.animSwitchButton.value;
            },
            child: Text("switcherSame动画")),
        Obx(() {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: state.animSwitchButton.value
                ? Container(
                    key: const ValueKey('23'),
                    width: 50,
                    height: 50,
                    color: Colors.green)
                : Container(
                    key: const ValueKey('33'),
                    width: 80,
                    height: 80,
                    color: Colors.redAccent),
          );
        }),
      ],
    );
  }

  Widget _switcherNotSameContainerAnim() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              state.animSwitchNotSameButton.value =
                  !state.animSwitchNotSameButton.value;
            },
            child: Text("switcherNotSame动画")),
        Obx(() {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                  turns: animation, alignment: Alignment.center, child: child);
            },
            child: state.animSwitchNotSameButton.value
                ? Container(width: 50, height: 50, color: Colors.green)
                : SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  ),
          );
        })
      ],
    );
  }
}
