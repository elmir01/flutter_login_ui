import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practice1/views/login/login_screen.dart';
import 'package:flutter_practice1/views/register/register_screen.dart';
import 'package:flutter_practice1/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScreen extends ConsumerStatefulWidget {
  const FirstScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends ConsumerState<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntrinsicWidth(
        stepWidth: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.sp,
              ),
              Image.asset('assets/bb.jpg'),
              SizedBox(
                height: 20.sp,
              ),
              Image.asset('assets/main.png'),
              SizedBox(
                height: 50.sp,
              ),
              CustomButton(
                text: 'Login',
                color: Color.fromRGBO(31, 65, 187, 1),
                ontap: () {
                  Navigator.push(
                    context,
                    CupertinoModalPopupRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                textColor: Colors.white,
              ),
              SizedBox(
                height: 30.sp,
              ),
              CustomButton(
                text: 'Register',
                textColor: Colors.black,
                color: Color.fromRGBO(255, 255, 255, 1),
                ontap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
