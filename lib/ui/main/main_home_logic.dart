import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainHomeLogic extends GetxController {
  final selectIndex = 0.obs;
  final pageControl = PageController(initialPage: 0, keepPage: true);

  void onNavigationTap(int index) {
    selectIndex.value = index;
    pageControl.jumpToPage(index);
    update();
  }

  @override
  void onClose() {
    pageControl.dispose();
    super.onClose();
  }
}
