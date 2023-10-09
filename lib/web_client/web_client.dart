import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_tests/web_client/service/user_service.dart';

class AppWebClient {
  static const String _baseUrl = 'http://192.168.218.37:7272/';
  final Dio client = Dio(BaseOptions(baseUrl: _baseUrl));

  final UserService userService;

}