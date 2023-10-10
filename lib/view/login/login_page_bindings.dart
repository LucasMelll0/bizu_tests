import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../data/shared_preferences_helper.dart';
import '../../repository/user_repository.dart';
import '../../web_client/service/user_service.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Logger());
    Get.lazyPut(() =>
        UserRepository(
            service: Get.find<UserService>(),
            prefs: Get.find<SharedPreferencesHelper>()),
    );
  }

}