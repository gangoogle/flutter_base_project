import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static late SharedPreferences sp;
  static const _userName = "USER_NAME";
  static const _loginToken = "login_token";

  static init() {
    SharedPreferences.getInstance().then((value) {
      sp = value;
    });
  }

  /// 保存用户名
  static void saveUserName(String name) {
    sp.setString(_userName, name);
  }

  /// 获取用户名
  static String getUserName() {
    return sp.getString(_userName) ?? "";
  }

  /// 保存登录token
  static void saveLoginToken(String token) {
    sp.setString(_loginToken, token);
  }

  /// 获取登录token
  static String getLoginToken() {
    return sp.getString(_loginToken) ?? "";
  }
}
