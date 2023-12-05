import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
      ),
      child: Image.asset(
        "image/login.PNG",
        fit: BoxFit.contain,
        width: 260.w,
        height: 235.h,
      ),
    );
  }
}
