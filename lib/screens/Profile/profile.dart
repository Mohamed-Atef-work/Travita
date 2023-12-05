import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigate_and_finish.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/Component/widgets/button/DefaultOutlindedButton.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/core/app_constants/constants.dart';
import 'package:travita/screens/REGISTERATION/LogIN/view.dart';
import 'package:travita/screens/make_your_plan_screens/show_all_manually_plans/view.dart';

import '../../Component/widgets/button/default_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Image.asset(
          "image/appBarLogo.png",
          width: 100.w,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("image/fav.jpg"),
                      radius: 60,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultText(
                      text: AppConstants.name,
                      fontWeight: FontWeight.w700,
                      textColor: AppColors.darkBlue,
                      fontSize: 25,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Divider(
                      color: AppColors.zety,
                      thickness: 1.2.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Reviews',
                      textColor: AppColors.darkBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 66,
                          height: 66,
                          child: Image.asset(
                            "image/plan.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: "The camping park",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.darkBlue,
                            ),
                            DefaultText(
                              text: "Written 02/18/23",
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              textColor: AppColors.darkGrey,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DefaultText(
                      text: 'Amazing place ',
                      textColor: AppColors.darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: DefaultText(
                        text:
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                        textColor: AppColors.darkBlue,
                        // fontSize: ,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  DefaultButton(
                    onPressed: () {},
                    width: 258,
                    height: 40,
                    backgroundColor: AppColors.darkOrange,
                    text: " Write a review",
                    textColor: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    borderRadius: 10,
                    opacity: 1,
                  ),
                  Divider(
                    color: AppColors.zety,
                    thickness: 1.2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: "Account info",
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.darkBlue,
                        fontSize: 20,
                      ),
                      Image.asset('image/add.png'),
                    ],
                  ),
                  Divider(
                    color: AppColors.zety,
                    thickness: 1.2.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          defaultNavigator(
                              context, const ShowAllManualPlansScreen());
                        },
                        child: DefaultText(
                          text: 'Your trips',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          textColor: AppColors.darkBlue,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.zety,
                    thickness: 1.2.h,
                  ),
                ],
              ),
              DefaultOutlinedButton(
                onPressed: () {
                  navigateAndFinish(
                      context: context, newScreen: const LoginScreen());
                },
                width: 100,
                height: 50,
                backgroundColor: AppColors.darkOrange,
                text: "Log Out",
                textColor: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
