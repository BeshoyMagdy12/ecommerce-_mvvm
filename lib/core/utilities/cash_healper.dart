import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> casheinitialization() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }




  static Future<bool> setDataString({required String key,required  String? value})async{
    return await _sharedPreferences.setString(key, value!);
  }
  static Future<bool> setDatabool({required String key,required  bool value})async{
    return await _sharedPreferences.setBool(key, value);
  }
  static Future<bool> setDataint({required String key,required  int value})async{
    return await _sharedPreferences.setInt(key, value);
  }
  static Future<bool> setDatadouble({required String key,required  double value})async{
    return await _sharedPreferences.setDouble(key, value);
  }

  static String?  getDataString({required String key}){
    return _sharedPreferences.getString(key);
  }


  static bool?  getDatabool({required String key}){
    return _sharedPreferences.getBool(key);
  }
  static int?  getDataint({required String key}){
    return _sharedPreferences.getInt(key);
  }
  static double?  getDatdouble({required String key}){
    return _sharedPreferences.getDouble(key);
  }


  static Future<bool> deleteData({required String key})async{
    return _sharedPreferences.remove(key);
  }

}
//  static Future<bool> setData({required String key, required dynamic value}) async {
//     if (value is bool) {
//       await _sharedPreferences.setBool(key, value);
//       return true;
//     } else if (value is String) {
//       await _sharedPreferences.setString(key, value);
//       return true;
//     } else if (value is int) {
//       await _sharedPreferences.setInt(key, value);
//       return true;
//     } else if (value is double) {
//       await _sharedPreferences.setDouble(key, value);
//       return true;
//     }
//     return false;
//   }