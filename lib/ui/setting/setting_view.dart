import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'setting_logic.dart';

/// 设置页面
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingLogic logic = Get.put(SettingLogic());

    return Scaffold(
      body: Column(
        children: [
          StatusBar(
            color: Colors.blueAccent,
            openStatusPadding: true,
            onBack: () {
              Get.back(result: {'key': "2"});
            },
          ),
          GetBuilder<SettingLogic>(
            builder: (logic) {
              return Text('last page args -> ${logic.argsText}');
            },
          ),
          _switcherSameContainerAnim(logic),
          _switcherNotSameContainerAnim(logic),
        ],
      ),
    );
  }

  Widget _switcherSameContainerAnim(SettingLogic logic) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            logic.animSwitchButton.toggle();
          },
          child: const Text("switcherSame动画"),
        ),
        Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: logic.animSwitchButton.value
                ? Container(
                    key: const ValueKey('23'),
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  )
                : Container(
                    key: const ValueKey('33'),
                    width: 80,
                    height: 80,
                    color: Colors.redAccent,
                  ),
          );
        }),
      ],
    );
  }

  Widget _switcherNotSameContainerAnim(SettingLogic logic) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            logic.animSwitchNotSameButton.toggle();
          },
          child: const Text("switcherNotSame动画"),
        ),
        Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                alignment: Alignment.center,
                child: child,
              );
            },
            child: logic.animSwitchNotSameButton.value
                ? Container(width: 50, height: 50, color: Colors.green)
                : SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(color: Colors.redAccent),
                  ),
          );
        }),
      ],
    );
  }
}
