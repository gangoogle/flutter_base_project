import 'package:get/get.dart';

class SettingLogic extends GetxController {
  String argsText = '';
  final animSwitchButton = false.obs;
  final animSwitchNotSameButton = false.obs;

  @override
  void onReady() {
    final arguments = Get.arguments;
    if (arguments is Map && arguments['msg'] is String) {
      argsText = arguments['msg'] as String;
    }
    update();
    super.onReady();
  }
}
