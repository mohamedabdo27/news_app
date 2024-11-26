import 'package:shared_preferences/shared_preferences.dart';

class CachedData {
  static SharedPreferences? sharedPreverences;
  static init() async {
    sharedPreverences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData(String key, bool value) async {
    return await sharedPreverences?.setBool(key, value);
  }

  static bool? getData(String key) {
    return sharedPreverences?.getBool(key);
  }
}
