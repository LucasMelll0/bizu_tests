import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import 'package:login_tests/model/company.dart';
import 'package:login_tests/utils/resource.dart';
import 'package:login_tests/web_client/request/UserLoginRequest.dart';

import '../response/login_response.dart';

class UserService {
  UserService({required this.client});

  final Dio client;

  final Logger log = Get.find<Logger>();

  Future<Resource<String>> loginUser(UserLoginRequest request) async {
    try {
      final response = await client.post('User/Login',
          data: {'email': request.email, 'password': request.password},
          options: Options(responseType: ResponseType.json));
      var token = LoginResponse.fromJson(response.data).metadata.data;
      return Future.value(Success(data: token));
    } on DioException catch (e) {
      log.e(e.message);
      if (e.response?.statusCode == 400) {
        return Future.value(Error(error: 'Verifique os campos de email/senha'));
      }
      return Future.value(Error(error: 'Ocorreu um erro'));
    }
  }

  Future<Resource<Company>> findUserCompany(String? token) async {
    try {
      client.options.headers['Authorization'] = 'Bearer $token';
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      var companyId = decodedToken['companyid'];
      final response = await client.get('Company/$companyId');
      var company = Company.fromJson(response.data);
      return Future.value(Success(data: company));
    }on DioException catch (e) {
      log.e(e.message);
      if(e.response?.statusCode == 404) {
        return Future.value(Error(error: 'Empresa não encontrada'));
      }
      print(e.message);
      return Future.value(Error(error: 'Ocorreu um erro'));
    }
  }
}
