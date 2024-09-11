import 'package:flutter/material.dart';
import 'package:flutter_practice1/models/auth/login/login_request.dart';
import 'package:flutter_practice1/services/auth_service.dart';
import 'package:flutter_practice1/views/home_page.dart';
import 'package:flutter_practice1/views/login/login_screen.dart';
import 'package:get_storage/get_storage.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  notifyListeners();
  void saveToken(String token) {
    final box = GetStorage();
    box.write('token', token);
  }

  void clearToken(BuildContext context) {
    final box = GetStorage();
    box.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<void> loginUser(BuildContext context) async {
    final loginRequest = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final response = await AuthService().login(loginRequest);
      saveToken(response.token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      print('Token: ${response.token}');
      notifyListeners();
    } catch (e) {
      print('Error: $e');
      notifyListeners();
    }
  }
}
