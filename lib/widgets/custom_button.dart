import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  String text;
  Color color;
  double? width;
  double? height;
  Function()? ontap;
  Color textColor;

  CustomButton(
      {required this.text,
      required this.textColor,
      this.width,
      this.height,
      required this.color,
      this.ontap});
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.ontap,
      child: Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        fixedSize: Size(273.sp, 50.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.sp,
            ),
          ),
        ),
      ),
    );
  }
}
