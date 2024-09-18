import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const _userName = "USER_NAME";
  static const _loginToken = "login_token";

  static getSp() async {
    return SharedPreferences.getInstance();
  }

  /// 保存用户名
  static void saveUserName(String name) async {
    var sp = await getSp();
    sp?.setString(_userName, name);
  }

  /// 获取用户名
  static Future<String> getUserName() async {
    var sp = await getSp();
    return sp?.getString(_userName) ?? "";
  }

  /// 保存登录token
  static void saveLoginToken(String token) async {
    var sp = await getSp();
    sp?.setString(_loginToken, token);
  }

  /// 获取登录token
  static Future<String> getLoginToken() async {
    var sp = await getSp();
    return sp?.getString(_loginToken) ?? "";
  }
}
