import 'package:first_project/api/api_ext.dart';
import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_logic.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutLogic logic = Get.put(AboutLogic());

    return Scaffold(
      body: Column(
        children: [
          StatusBar(
            onBack: () {
              Get.back();
            },
            color: "#5dd8ff".color,
            openStatusPadding: true,
          ),
          Obx(() => Text(logic.name.string)),
          Obx(() => Text("This is Page")),
        ],
      ),
    );
  }
}
