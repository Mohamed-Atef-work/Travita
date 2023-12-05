import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40.h,
      ),
      child: Image.asset(
          "image/login.PNG",
        fit: BoxFit.contain,
        width: 310.w,
        height: 300.h,
      ),
    );
  }
}
