import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/bean/Item_data.dart';
import 'list_logic.dart';
import 'list_state.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

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
              color: Colors.black,
              openStatusPadding: true),
          ElevatedButton(
              onPressed: () => logic.addListWords, child: Text("insert")),
          GetBuilder<ListLogic>(builder: (logic) {
            return Container(
              child: Expanded(
                child: _buildListGridView(state.gridViewList),
                flex: 1,
              ),
            );
          }),
        ],
      ),
    );
  }

  GridView _buildListGridView(List<ItemData> list) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              color: list[index].bgColor,
              child: Center(child: Text("${list[index].text}")));
        });
  }
}
