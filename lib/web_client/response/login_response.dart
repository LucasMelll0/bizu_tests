import 'package:login_tests/web_client/response/common_response.dart';

class LoginResponse extends CommonResponse<String> {
  LoginResponse({required super.message, required super.metadata});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      message: json['message'],
      metadata: CommonResponseMetadata<String>(data: json['metadata']['data']));
}
