import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice1/views/login/password_changed_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;
  var _key = GlobalKey<FormState>();

  void initState() {
    _passwordVisible1 = false;
    _passwordVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: IntrinsicWidth(
        stepWidth: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.sp,
          ),
          child: Column(
            children: [
              Text(
                'Create new password',
                style: TextStyle(
                  color: Color.fromRGBO(31, 65, 187, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Your new password must be unique from those previously used.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Color.fromRGBO(30, 35, 44, 1),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Incorrect email or password. Please try again.';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      obscureText: !_passwordVisible1,
                      controller: _passwordController1,
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
                        hintText: 'New password',
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
                        if (value!.isEmpty) {
                          return 'Incorrect email or password. Please try again.';
                        } else {
                          return null;
                        }
                      },
                      obscureText: !_passwordVisible2,
                      controller: _passwordController2,
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
                        hintText: 'Confirm password',
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
                    ElevatedButton(
                      onPressed: () {
                        if (_passwordController1.text ==
                                _passwordController2.text &&
                            _key.currentState!.validate()) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PasswordChangedScreen(),
                            ),
                          );
                        } else {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'The passwords are not the same',
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
                      },
                      child: Text(
                        'Reset your password',
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
            ],
          ),
        ),
      ),
    );
  }
}
