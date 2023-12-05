import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';

import '../../Component/widgets/button/default_button.dart';

class FiltrationScreen extends StatelessWidget {
  const FiltrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.darkOrange,
                        child: Center(
                            child: Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                          size: 20,
                        ))),
                  ),
                  SizedBox(
                    width: 115.w,
                  ),
                  DefaultText(
                    text: "Filters",
                    textColor: AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 25.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              DefaultText(
                text: "Sort by",
                textColor: AppColors.darkOrange,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DefaultButton(
                    onPressed: () {},
                    width: 228.w,
                    height: 56.h,
                    backgroundColor: AppColors.white,
                    text: "Traveler ranking",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.sp,
                    opacity: 0,
                    borderRadius: 20,
                    //borderColor: AppColors.darkGrey,
                  ),
                  DefaultButton(
                    onPressed: () {},
                    width: 228.w,
                    height: 56.h,
                    backgroundColor: AppColors.white,
                    text: "relevance",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.sp,
                    opacity: 0,
                    borderRadius: 20,
                    //borderColor: AppColors.darkGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              DefaultText(
                text: "Restaurant Type",
                textColor: AppColors.darkOrange,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.white,
                        text: "restaurant",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 0,
                        borderRadius: 20,
                        //borderColor: AppColors.darkGrey,
                      ),
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.white,
                        text: "Dessert",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 0,
                        borderRadius: 20,
                        //borderColor: AppColors.darkGrey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultButton(
                    onPressed: () {},
                    width: 175.w,
                    height: 56.h,
                    backgroundColor: AppColors.white,
                    text: "Coffee&Tea",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.sp,
                    opacity: 0,
                    borderRadius: 20,
                    //borderColor: AppColors.darkGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              DefaultText(
                text: "Restaurant Features",
                textColor: AppColors.darkOrange,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.white,
                        text: "restaurant",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 0,
                        borderRadius: 20,
                        //borderColor: AppColors.darkGrey,
                      ),
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.white,
                        text: "Dessert",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 0,
                        borderRadius: 20,
                        //borderColor: AppColors.darkGrey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultButton(
                    onPressed: () {},
                    width: 175.w,
                    height: 56.h,
                    backgroundColor: AppColors.white,
                    text: "Coffee&Tea",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.sp,
                    opacity: 0,
                    borderRadius: 20,
                    //borderColor: AppColors.darkGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              DefaultText(
                text: "Restaurant Features",
                textColor: AppColors.darkOrange,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.white,
                        text: "restaurant",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 0,
                        borderRadius: 20,
                        //borderColor: AppColors.darkGrey,
                      ),
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.white,
                        text: "Dessert",
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 0,
                        borderRadius: 20,
                        //borderColor: AppColors.darkGrey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultButton(
                    onPressed: () {},
                    width: 175.w,
                    height: 56.h,
                    backgroundColor: AppColors.white,
                    text: "Coffee&Tea",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 25.sp,
                    opacity: 0,
                    borderRadius: 20,
                    //borderColor: AppColors.darkGrey,
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(
                    thickness: 2,
                    color: AppColors.darkGrey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultText(
                        text: 'Clear filters',
                        textColor: AppColors.darkBlue,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      DefaultButton(
                        onPressed: () {},
                        width: 157.w,
                        height: 56.h,
                        backgroundColor: AppColors.darkOrange,
                        text: "10 Results",
                        textColor: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 25.sp,
                        opacity: 1,
                        borderRadius: 20,
                        //borderColor: AppColors.transparent,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
