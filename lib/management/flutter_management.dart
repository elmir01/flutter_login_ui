import 'package:flutter_practice1/viewmodels/login_viewmodel.dart';
import 'package:flutter_practice1/viewmodels/register_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var registerViewModel = ChangeNotifierProvider((ref) => RegisterViewModel());
var loginViewModel = ChangeNotifierProvider((ref) => LoginViewModel());