import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_tests/utils/resource.dart';
import 'package:login_tests/web_client/request/UserLoginRequest.dart';
import 'package:login_tests/web_client/response/common_response.dart';

import '../response/login_response.dart';

class UserService {
  const UserService({required this.client});

  final Dio client;

  Future<Resource<String>> loginUser(UserLoginRequest request) async {
    print('login');
    try {
      final response = await client.post('User/Login',
          data: {'email': request.email, 'password': request.password},
          options: Options(responseType: ResponseType.json));
      /*var jsonResponseBody = jsonDecode(response.data);
      var responseMetadata = LoginResponse.fromJson(jsonResponseBody);*/
      print('sucesso');
      var token = LoginResponse.fromJson(response.data).metadata.data;
      return Future.value(Success(data: token));
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return Future.value(Error(error: 'Verifique os campos de email/senha'));
      }
      return Future.value(Error(error: 'Ocorreu um erro'));
    }
  }
}
