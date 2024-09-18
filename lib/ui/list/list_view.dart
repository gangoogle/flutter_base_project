import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/bean/Item_data.dart';
import 'list_logic.dart';
import 'list_state.dart';

///列表页面
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListLogic logic = Get.put(ListLogic());
    final ListState state = Get.find<ListLogic>().state;

    return Scaffold(
      body: Column(
        children: [
          StatusBar(
              onBack: () {
                Get.back();
              },
              color: Colors.green,
              openStatusPadding: true),
          ElevatedButton(
              onPressed: () {
                print("new pressed");
                logic.addListWords;
              },
              child: Text("new")),
          Expanded(
            flex: 1,
            child: _buildListGridView(),
          ),
        ],
      ),
    );
  }

  Widget _buildListGridView() {
    final ListState state = Get.find<ListLogic>().state;
    return Obx(() {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: state.gridViewList.length,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                color: state.gridViewList[index].bgColor,
                child: Center(child: Text("${state.gridViewList[index].text}")));
          });
    });
  }
}
