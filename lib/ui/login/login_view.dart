import 'package:first_project/api/widget_ext.dart';
import 'package:first_project/ui/common/base_screen.dart';
import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../common/space.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginLogic logic = Get.put(LoginLogic());
    final LoginState state = Get.find<LoginLogic>().state;
    return BasePage(
      child: Scaffold(
        body: Container(
          color: Colors.white30,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 50)),
                      const Space(height: 50),
                      const Image(
                        image: AssetImage("assets/images/android.png"),
                        width: 50,
                        height: 50,
                      ),
                      Obx(() {
                        return Text(state.accountName.value);
                      }),
                      const Space(height: 50),
                      _inputView("账号", (value) {
                        state.accountName.value = value;
                      }),
                      const Space(height: 50),
                      _inputView("密码", (value) {
                        state.accountPassword.value = value;
                      }),
                      const Space(height: 50),
                      ElevatedButton(onPressed: () {}, child: Text('登录')),
                      ElevatedButton(onPressed: (){
                        Get.back();
                      }, child: Text('退出'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputView(String lable, Function(String value) onChangeCallBack) {
    return TextField(
      onChanged: (valve) {
        onChangeCallBack(valve);
      },
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.amber, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 5)),
          labelText: lable,
          hintText: "输入$lable",
          prefixIcon: const Icon(Icons.headphones)),
    );
  }
}
