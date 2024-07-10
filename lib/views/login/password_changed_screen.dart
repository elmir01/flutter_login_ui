import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice1/views/login/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangedScreen extends ConsumerStatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends ConsumerState<PasswordChangedScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: Column(
            children: [
              SizedBox(
                height: 50.sp,
              ),
              Image.asset(
                'assets/passwordok.png',
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Password changed!',
                style: TextStyle(
                  color: Color.fromRGBO(30, 35, 44, 1),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Text(
                'Your password has been changed successfully.',
                style: TextStyle(
                  color: Color.fromRGBO(30, 35, 44, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 40.sp,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                },
                child: Text(
                  'Back to login',
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
      ),
    );
  }
}
