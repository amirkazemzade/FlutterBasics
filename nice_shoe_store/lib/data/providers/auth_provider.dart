import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nike_shoe_store/data/model/error_response.dart';
import 'package:nike_shoe_store/data/model/sign_up_response.dart';

class AuthProvider {
  final _dio = Dio();

  Future<SignUpResponse> signUp(String email, String password) async {
    try {
      final response = await _dio.post(
        'http://expertdevelopers.ir/api/v1/user/register',
        data: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      return SignUpResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw ErrorResponse.fromJson(e.response?.data);
    }
  }
}
