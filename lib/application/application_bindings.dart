import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login_tests/data/shared_preferences_helper.dart';
import 'package:login_tests/repository/user_repository.dart';
import 'package:login_tests/web_client/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationBindings implements Bindings {
  static const String _baseUrl = 'http://192.168.218.37:7272/';

  @override
  void dependencies() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    Get.put(Dio(BaseOptions(baseUrl: _baseUrl)));
    Get.put(UserService(client: Get.find<Dio>()));
    Get.put(sharedPrefs);
    Get.put(SharedPreferencesHelper());
    Get.lazyPut(() =>
      UserRepository(
          service: Get.find<UserService>(),
          prefs: Get.find<SharedPreferencesHelper>()),
    );
  }
}
