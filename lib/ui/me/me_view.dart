import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'me_logic.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MeLogic());
    final state = Get.find<MeLogic>().state;

    return Container();
  }
}
