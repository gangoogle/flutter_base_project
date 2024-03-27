import 'package:first_project/api/api_ext.dart';
import 'package:first_project/api/widget_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/status_bar_padding.dart';
import 'me_logic.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MeLogic());
    final state = Get.find<MeLogic>().state;

    return Container(
      color: '#f3f5f5'.color,
      child: Column(children: [
        StatusBarPaddingView(color: "#2b2d30".color),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Image(
                image: AssetImage('assets/images/android.png'),
                width: 70,
                height: 70,
              ),
              Space(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'admin',
                    style: TextStyle(
                      color: '#0341dd'.color,
                      fontSize: 16,
                    ),
                  ),
                  Space(height: 10),
                  Text(
                    '100645',
                    style: TextStyle(
                      color: '#0341dd'.color,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SpliteLineH(),
        Space(height: 10),
        _buildCard()
      ]),
    );
  }

  Widget _buildCard() {
    final logicAll = Get.find<MeLogic>();
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [Icon(Icons.adb), Space(height: 10), Text("手电筒")],
              ),
            ),
            Expanded(
              flex: 1,
              child: GetBuilder<MeLogic>(builder: (logic) {
                return InkWell(
                  onTap: () {
                    logic.updateTest();
                  },
                  child: Column(
                    children: [
                      Icon(Icons.adb),
                      Space(height: 10),
                      Text("${logic.state.test}")
                    ],
                  ),
                );
              }),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  logicAll.updateTest();
                },
                child: Column(
                  children: [Icon(Icons.adb), Space(height: 10), Text("手电筒")],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
