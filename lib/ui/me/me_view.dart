import 'dart:math';
import 'package:first_project/api/api_ext.dart';
import 'package:first_project/api/widget_ext.dart';
import 'package:first_project/data/bean/ItemData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/space.dart';
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
        _userTitleView(),
        splitLineH(),
        const Space(height: 10),
        _buildCard(),
        Expanded(
          child: Container(color: Colors.lightGreen, child: _buildList()),
          flex: 1,
        ),
        Expanded(
          child: Container(color: Colors.blueGrey, child: _buildGridView()),
          flex: 1,
        ),
        ElevatedButton(
            onPressed: () {
              logic.addListWords();
            },
            child: Text("列表添加数据")),
        GetBuilder<MeLogic>(builder: (logic) {
          return Expanded(
            child: Container(child: _buildListGridView(state.gridViewList)),
            flex: 1,
          );
        })
      ]),
    );
  }

  //用户标题
  Padding _userTitleView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Space(width: 10),
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
                  fontSize: 18,
                ),
              ),
              Space(height: 10),
              Text(
                '100645',
                style: TextStyle(
                  color: '#0341dd'.color,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    final logicAll = Get.find<MeLogic>();
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GetBuilder<MeLogic>(builder: (logic) {
                return InkWell(
                  onTap: () {
                    logic.updateMinus();
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
              child: GetBuilder<MeLogic>(builder: (logic) {
                return InkWell(
                  onTap: () {
                    logic.updatePlus();
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
                onTap: () {},
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

  ListView _buildList() {
    return ListView(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      children: [
        Container(
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text('关于我们'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('设置'),
        ),
        ListTile(
          leading: Icon(Icons.cached),
          title: Text('缓存'),
        ),
      ],
    );
  }

  GridView _buildGridView() {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(child: Text("${index}"));
        }));
  }

  GridView _buildListGridView(List<ItemData> list) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
