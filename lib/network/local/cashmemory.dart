import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class CashHelper {
  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setbooldata({required String key, required bool value}) async {
    return await prefs.setBool(key, value);
  }

  static bool? getbooldata({required String key})  {
    return  prefs.getBool(key);
  }
}
