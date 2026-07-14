import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'list_logic.dart';

///列表页面
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListLogic logic = Get.put(ListLogic());

    return Scaffold(
      body: Column(
        children: [
          StatusBar(
            onBack: () {
              Get.back();
            },
            color: Colors.green,
            openStatusPadding: true,
          ),
          ElevatedButton(
            onPressed: () {
              logic.addListWords();
            },
            child: const Text("new"),
          ),
          Expanded(flex: 1, child: _buildListGridView(logic)),
        ],
      ),
    );
  }

  Widget _buildListGridView(ListLogic logic) {
    return Obx(() {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: logic.gridViewList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            color: logic.gridViewList[index].bgColor,
            child: Center(child: Text(logic.gridViewList[index].text)),
          );
        },
      );
    });
  }
}
