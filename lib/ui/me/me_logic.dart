import 'package:first_project/data/bean/ItemData.dart';
import 'package:first_project/util/RandomUtils.dart';
import 'package:get/get.dart';

import 'me_state.dart';

class MeLogic extends GetxController {
  final MeState state = MeState();

  void updatePlus() {
    state.test++;
    update();
  }

  void updateMinus() {
    state.test--;
    update();
  }
}
