import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'task_list_logic.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TaskListLogic());
    final state = Get.find<TaskListLogic>().state;
    return Container();
  }
}
