import 'package:first_project/ui/common/space.dart';
import 'package:first_project/ui/home/home_view.dart';
import 'package:first_project/ui/me/me_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/keep_alive.dart';
import 'main_home_logic.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainHomeLogic());
    final state = Get.find<MainHomeLogic>().state;

    return Scaffold(
      body: PageView(
        controller: state.pageControl,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PagerKeepAliveWrapper(child: HomePage()),
          const PagerKeepAliveWrapper(child: MePage()),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white54,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Space(height: 100),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("抽屉1"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("抽屉2"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("抽屉3"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '菜单'),
          ],
          currentIndex: state.selectIndex.value,
          onTap: logic.onNavigationTap,
        );
      }),
    );
  }
}
