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
    var tempList = <ItemData>[];
    for (int i = 0; i < 100; i++) {
      tempList.add(ItemData(generateRandomString(5), getRandomColor()));
    }
    state.gridViewList.clear();
    state.gridViewList.addAll(tempList);
  }

  void addListWords() {
    print("addListWords ->");
    var tempList = <ItemData>[];
    for (int i = 0; i < 20; i++) {
      tempList.add(ItemData(generateRandomString(5), getRandomColor()));
    }
    state.gridViewList.addAll(tempList);
    print("addListWords length :${state.gridViewList.length}");
    state.gridViewList.refresh();
  }
}
