import 'package:get/get.dart';

import '../../data/bean/Item_data.dart';
import '../../util/random_utils.dart';
import 'list_state.dart';

class ListLogic extends GetxController {
  final ListState state = ListState();

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    for (int i = 0; i < 100; i++) {
      state.gridViewList
          .add(ItemData(generateRandomString(5), getRandomColor()));
    }
    update();
  }

  void addListWords() {
    for (int i = 0; i < 20; i++) {
      state.gridViewList
          .add(ItemData(generateRandomString(5), getRandomColor()));
    }
    update();
  }
}
