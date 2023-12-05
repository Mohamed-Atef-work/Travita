import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/onBoarding/widgets/curve.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/button/registeration_button.dart';
import '../../REGISTERATION/LogIN/view.dart';
import '../../REGISTERATION/SignUp/view.dart';
import '../../REGISTERATION/widgets/accountsIcons.dart';

class OnBoardingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 540.h,
      child: Stack(
        children: [
          OnBoardingCurve(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
            ),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 115.h,
                ),
                Text(
                  "Discover unforgettable travel experience",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "We will help you prepare a complete plan for your trip in the best way possible",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16.sp,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: RegisterationButton(
                        name: "Log IN",
                        width: 170.w,
                        height: 50.h,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: RegisterationButton(
                        name: "Sign Up",
                        width: 170.w,
                        height: 50.h,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                AccountsIcons(
                  connect: "connect",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
