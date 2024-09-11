import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const _userName = "USER_NAME";

  static Future<SharedPreferences> getAppCache() async {
    return await SharedPreferences.getInstance();
  }

  static void saveUserName(String name) {
    getAppCache().then((app) {
      app.setString(_userName, name);
    });
  }

  static Future<String> getUserName() async {
    SharedPreferences app = await getAppCache();
    return (app.getString(_userName) ?? "");
  }
}
