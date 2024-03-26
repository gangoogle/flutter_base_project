import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/api/keep_alive.dart';
import 'main_home_logic.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainHomeLogic());
    final state = Get.find<MainHomeLogic>().state;
    return GetBuilder<MainHomeLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Text'),
          actions: [
            TextButton(onPressed: () {}, child: Text('action')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.adb),
        ),
        body: PageView(
          controller: state.pageControl,
          children: [
            KeepAliveWrapper(child: HomePage()),
            KeepAliveWrapper(child: MePage()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '菜单'),
          ],
          currentIndex: state.selectIndex,
          onTap: logic.onNavigationTap,
        ),
      );
    });
  }
}
