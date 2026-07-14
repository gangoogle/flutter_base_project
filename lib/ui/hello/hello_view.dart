import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hello_logic.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HelloLogic logic = Get.put(HelloLogic());

    return Scaffold(
      appBar: AppBar(title: const Text('HelloPage')),
      body: Center(child: Obx(() => Text(logic.title.value))),
    );
  }
}
