import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../colors/colors.dart';

class DefaultFormField extends StatelessWidget {
  late final double width;
  late double height;
  late final TextEditingController controller;
  late final TextInputType type;
  final String? Function(String?)? validate;
  final String? hintText;
  bool? obSecure;
  IconData? prefix;
  IconData? suffix;
  void Function()? suffixButtonPressed;
  bool isPassword;
  late final Color borderColor;
  late final Color cursorColor;
  late final Color textColor;

  DefaultFormField({
    required this.width,
    required this.height,
    required this.controller,
    required this.type,
    required this.validate,
    this.hintText,
    this.isPassword = false,
    this.suffixButtonPressed,
    this.obSecure,
    this.prefix,
    this.suffix,
    this.borderColor = AppColors.white,
    this.textColor = AppColors.white,
    this.cursorColor = AppColors.white,
    //this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: cursorColor,
        keyboardType: type,
        controller: controller,
        obscureText: obSecure ?? false,
        validator: validate,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
          suffixIcon: isPassword == true
              ? InkWell(
                  onTap: suffixButtonPressed,
                  child: Icon(
                    suffix,
                    size: 20,
                    color: AppColors.ofBlue,
                  ),
                )
              : null,
          // prefix: prefix != null ? Icon(prefix) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
        ),
      ),
    );
  }
}
