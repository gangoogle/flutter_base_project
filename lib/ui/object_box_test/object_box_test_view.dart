import 'package:first_project/ui/common/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../database/user.dart';
import '../../util/random_utils.dart';
import 'object_box_test_logic.dart';
import 'object_box_test_state.dart';

class ObjectBoxTestPage extends StatelessWidget {
  const ObjectBoxTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ObjectBoxTestLogic logic = Get.put(ObjectBoxTestLogic());
    final ObjectBoxTestState state = Get.find<ObjectBoxTestLogic>().state;
    return Scaffold(
      body: Container(
        child: Container(
          child: Column(
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
                            children: [
                              Icon(Icons.add),
                              Text("新增"),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              _objectList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _objectList() {
    final logic = Get.find<ObjectBoxTestLogic>();
    final ObjectBoxTestState state = logic.state;
    return Obx(() {
      return Expanded(
        flex: 1,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _itemView(state.data[index], () {
              logic.deleteUser(state.data[index]);
            }, (newText) {
              logic.updateUser(state.data[index], newText);
            });
          },
          itemCount: state.data.length,
        ),
      );
    });
  }

  Widget _itemView(
      User user, VoidCallback onClick, Function(String) updateCall) {
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
                    child: Text("修改"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
