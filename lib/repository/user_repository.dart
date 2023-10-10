import 'package:login_tests/data/shared_preferences_helper.dart';
import 'package:login_tests/web_client/request/UserLoginRequest.dart';
import 'package:login_tests/web_client/service/user_service.dart';

import '../model/company.dart';
import '../utils/resource.dart';

class UserRepository {

  UserRepository({required this.service, required this.prefs});

  final UserService service;
  final SharedPreferencesHelper prefs;


  Future<Resource<String>> loginUser(UserLoginRequest request) async {
    var response = await service.loginUser(request);
    if(response is Success) {
      var token = (response as Success).data;
      var isSuccess = await prefs.saveToken(token);
      return isSuccess ? response : Error(error: 'Falha ao salvar token');
    }
    return Future.value(response);
  }

  Future<Resource<Company>> findUserCompany() async {
      var token = await prefs.findToken();
      return service.findUserCompany(token);
  }





}


