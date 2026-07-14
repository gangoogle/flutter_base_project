import 'package:get/get.dart';

import '../../data/bean/item_data_model.dart';
import '../../util/random_utils.dart';

class ListLogic extends GetxController {
  final gridViewList = <ItemData>[].obs;

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
    gridViewList.clear();
    gridViewList.addAll(tempList);
  }

  void addListWords() {
    var tempList = <ItemData>[];
    for (int i = 0; i < 20; i++) {
      tempList.add(ItemData(generateRandomString(5), getRandomColor()));
    }
    gridViewList.addAll(tempList);
    gridViewList.refresh();
  }
}
