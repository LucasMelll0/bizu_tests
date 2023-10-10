import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences prefs = Get.find<SharedPreferences>();
  static const String tokenKey = "token";

  Future<bool> saveToken(String token) async {
    try {
      await prefs.setString(tokenKey, token);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<String?> findToken() async {
    var token = prefs.getString(tokenKey);
    return token;
  }
}
