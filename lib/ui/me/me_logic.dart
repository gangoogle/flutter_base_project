import 'package:first_project/data/bean/Item_data.dart';
import 'package:first_project/util/random_utils.dart';
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
