import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/forgot_password_screen.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  var _key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;
  bool checkboxValue = false;

  void initState() {
    _passwordVisible1 = false;
    _passwordVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: IntrinsicWidth(
        stepWidth: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp),
          child: Column(
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                  color: Color.fromRGBO(31, 65, 187, 1),
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: !_passwordVisible1,
                      controller: passwordController1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                          icon: _passwordVisible1
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController1.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      obscureText: !_passwordVisible2,
                      controller: passwordController2,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              _passwordVisible2 = !_passwordVisible2;
                            });
                          },
                          icon: _passwordVisible2
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1),
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              checkboxValue = value!;
                            });
                          },
                        ),
                        Text(
                          'I agree to the ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color.fromRGBO(30, 35, 44, 1),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Privacy policy ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Color.fromRGBO(72, 96, 196, 1),
                            ),
                          ),
                        ),
                        Text(
                          'and ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color.fromRGBO(30, 35, 44, 1),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              'Terms of use',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Color.fromRGBO(72, 96, 196, 1),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    ElevatedButton(
                      onPressed: checkboxValue? () {
                        if (_key.currentState!.validate()) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Successfully registered',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            action: SnackBarAction(
                              textColor: Colors.black,
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } :null,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width, 50.sp),
                        backgroundColor: Color.fromRGBO(31, 65, 187, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.sp,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(232, 236, 244, 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Text(
                      'Or register with',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(232, 236, 244, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp,),
              IntrinsicWidth(
                // stepHeight: double.infinity,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/facebook.png'),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/google.png'),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/apple.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
