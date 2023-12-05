import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import '../../Component/widgets/button/registeration_button.dart';
import '../REGISTERATION/LogIN/view.dart';
import '../REGISTERATION/SignUp/view.dart';
import '../REGISTERATION/widgets/accountsIcons.dart';

class Ask extends StatelessWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 220.h,
                child: Image.asset("image/ask.PNG"),
              ),
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    color: AppColors.darkBlue,
                    child: Column(
                      children: [
                        Container(
                          width: 100.w,
                          height: 250.h,
                          color: Colors.transparent,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Discover unforgettable travel experience",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 28.sp,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                " Shop online and get groceries delivered from stores to your"
                                " home in as fast as 1 hour ",
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 100.h),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                    child: RegisterationButton(
                                      name: "Log IN",
                                      width: 150.w,
                                      height: 40.h,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()),
                                      );
                                    },
                                    child: RegisterationButton(
                                      name: "Sign Up",
                                      width: 150.w,
                                      height: 40.h,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AccountsIcons(
                                  connect: "connect", onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0019370, size.height * 0.5005606);
    path0.cubicTo(
        size.width * 0.0223729,
        size.height * 0.4004697,
        size.width * 0.1133898,
        size.height * 0.3454848,
        size.width * 0.2773123,
        size.height * 0.3470152);
    path0.cubicTo(
        size.width * 0.4491041,
        size.height * 0.3472424,
        size.width * 0.5043099,
        size.height * 0.3455758,
        size.width * 0.7745763,
        size.height * 0.3463333);
    path0.quadraticBezierTo(size.width * 0.9621792, size.height * 0.3453939,
        size.width, size.height * 0.1865455);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.quadraticBezierTo(size.width * -0.0007022, size.height * 0.6081667,
        size.width * 0.0019370, size.height * 0.5005606);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
