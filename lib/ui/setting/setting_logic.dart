import 'package:get/get.dart';

import 'setting_state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  @override
  void onReady() {
    var map = Get.arguments;
    state.argsText = map['msg'];

    update();
    super.onReady();
  }
}
