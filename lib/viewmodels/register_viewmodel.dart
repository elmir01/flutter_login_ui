import 'package:flutter/material.dart';
import 'package:flutter_practice1/models/auth/register/register_request.dart';
import 'package:flutter_practice1/services/auth_service.dart';
import 'package:flutter_practice1/views/home_page.dart';
import 'package:flutter_practice1/views/login/login_screen.dart';
import 'package:get_storage/get_storage.dart';

class RegisterViewModel extends ChangeNotifier {
  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  notifyListeners();
  Future<void> registerUser() async {
    final registerRequest = RegisterRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController1.text,
      rePassword: passwordController2.text,
    );

    try {
      final response = await authService.register(registerRequest);

      print('Token: ${response.token}');

      notifyListeners();
    } catch (e) {
      print('Error: $e');
      notifyListeners();
    }
  }
}
