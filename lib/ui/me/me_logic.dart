import 'package:get/get.dart';

class MeLogic extends GetxController {
  int test = 100;

  void updatePlus() {
    test++;
    update();
  }

  void updateMinus() {
    test--;
    update();
  }
}
