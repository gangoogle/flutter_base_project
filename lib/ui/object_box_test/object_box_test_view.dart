import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../database/user.dart';
import '../../util/random_utils.dart';
import 'object_box_test_logic.dart';

class ObjectBoxTestPage extends StatelessWidget {
  const ObjectBoxTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ObjectBoxTestLogic logic = Get.put(ObjectBoxTestLogic());

    return Scaffold(
      body: Column(
        children: [
          StatusBar(
            onBack: () {
              Get.back();
            },
            title: "ObjectBoxTest",
            color: Colors.blueGrey,
            openStatusPadding: true,
          ),
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      logic.addNewUser();
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Icon(Icons.add), Text("新增")],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _objectList(logic),
        ],
      ),
    );
  }

  Widget _objectList(ObjectBoxTestLogic logic) {
    return Obx(() {
      return Expanded(
        flex: 1,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _itemView(
              logic.data[index],
              () {
                logic.deleteUser(logic.data[index]);
              },
              (newText) {
                logic.updateUser(logic.data[index], newText);
              },
            );
          },
          itemCount: logic.data.length,
        ),
      );
    });
  }

  Widget _itemView(
    User user,
    VoidCallback onClick,
    Function(String) updateCall,
  ) {
    return Card(
      color: Colors.white60,
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${user.id}"),
                      Text("${user.name}"),
                      Text("${user.text}"),
                      Text("${user.comment}"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    updateCall(generateRandomString(5));
                  },
                  child: const Text("修改"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
