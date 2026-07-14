import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const _userName = "USER_NAME";
  static const _loginToken = "login_token";

  static SharedPreferences? _preferences;

  static Future<SharedPreferences> getSp() async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  /// 保存用户名
  static Future<bool> saveUserName(String name) async {
    var sp = await getSp();
    return sp.setString(_userName, name);
  }

  /// 获取用户名
  static Future<String> getUserName() async {
    var sp = await getSp();
    return sp.getString(_userName) ?? "";
  }

  /// 保存登录token
  static Future<bool> saveLoginToken(String token) async {
    var sp = await getSp();
    return sp.setString(_loginToken, token);
  }

  /// 获取登录token
  static Future<String> getLoginToken() async {
    var sp = await getSp();
    return sp.getString(_loginToken) ?? "";
  }

  static void resetForTesting() => _preferences = null;
}
