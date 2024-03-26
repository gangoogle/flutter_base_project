import 'package:get/get.dart';

import 'main_home_state.dart';

class MainHomeLogic extends GetxController {
  final MainHomeState state = MainHomeState();

  void onNavigationTap(int index) {
    state.selectIndex = index;
    state.pageControl.jumpToPage(index);
  }
}
