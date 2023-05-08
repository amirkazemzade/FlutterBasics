import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nike_shoe_store/data/model/Login_response.dart';
import 'package:nike_shoe_store/data/model/login_request.dart';
import 'package:nike_shoe_store/data/model/sign_up_response.dart';

class UserProvider {
  final _dio = Dio();

  Future<SignUpResponse> signUp(String email, String password) async {
    try {
      final response = await _dio.post(
        "http://expertdevelopers.ir/api/v1/user/register",
        data: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      return SignUpResponse.fromJson(response.data);
    } on DioError catch (e) {
      log(e.response.toString());
      rethrow;
    }
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        "http://expertdevelopers.ir/api/v1/auth/token",
        data: jsonEncode(loginRequest.toJson()),
      );
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      log(e.response.toString());
      rethrow;
    }
  }
}
