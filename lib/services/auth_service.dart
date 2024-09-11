import 'dart:convert';

import 'package:flutter_practice1/models/auth/login/login_model.dart';
import 'package:flutter_practice1/models/auth/login/login_request.dart';
import 'package:flutter_practice1/models/auth/register/register_model.dart';
import 'package:flutter_practice1/models/auth/register/register_request.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String registerApiUrl = "http://10.0.2.2:5055/api/Auth/register"; 
  final String loginApiUrl = "http://10.0.2.2:5055/api/Auth/login"; 
  Future<RegisterModel> register(RegisterRequest request) async {
    final response = await http.post(
      Uri.parse(registerApiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return RegisterModel.fromJson(responseData);
    } else {
      throw Exception('Failed to register');
    }
  }
  Future<LoginModel> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse(loginApiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return LoginModel.fromJson(responseData);
    } else {
      throw Exception('Failed to login');
    }
  }
}
