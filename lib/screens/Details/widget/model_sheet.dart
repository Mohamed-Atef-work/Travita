import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/core/app_controller/appController.dart';

import '../../../Component/widgets/defaultText.dart';

class DetailsModelSheetWidget extends StatelessWidget {
  //final DetailsModel detailsModel;

  const DetailsModelSheetWidget(/*{required this.detailsModel}*/);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultText(
                textOverflow: TextOverflow.fade,
                text: "Name :",
                fontSize: 25.sp,
                textColor: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    DefaultText(
                      textOverflow: TextOverflow.fade,
                      text: AppController.get(context).detailsModel!.name,
                      fontSize: 25.sp,
                      textColor: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultText(
                textOverflow: TextOverflow.fade,
                text: "Description :",
                fontSize: 25.sp,
                textColor: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    DefaultText(
                      textOverflow: TextOverflow.fade,
                      text: AppController.get(context)
                              .detailsModel
                              ?.description ??
                          "UnKnown",
                      fontSize: 25.sp,
                      textColor: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultText(
                textOverflow: TextOverflow.fade,
                text: "Address :",
                fontSize: 25.sp,
                textColor: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    DefaultText(
                      textOverflow: TextOverflow.fade,
                      text: AppController.get(context).detailsModel?.address ??
                          "UnKnown",
                      fontSize: 25.sp,
                      textColor: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultText(
                textOverflow: TextOverflow.fade,
                text: "Email :",
                fontSize: 25.sp,
                textColor: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    DefaultText(
                      textOverflow: TextOverflow.fade,
                      text: AppController.get(context).detailsModel?.email ??
                          "UnKnown",
                      fontSize: 25.sp,
                      textColor: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultText(
                textOverflow: TextOverflow.fade,
                text: "Phone :",
                fontSize: 25.sp,
                textColor: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    DefaultText(
                      textOverflow: TextOverflow.fade,
                      text: AppController.get(context).detailsModel?.phone ??
                          "UnKnown",
                      fontSize: 25.sp,
                      textColor: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultText(
                textOverflow: TextOverflow.fade,
                text: "Website :",
                fontSize: 25.sp,
                textColor: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    DefaultText(
                      textOverflow: TextOverflow.fade,
                      text: AppController.get(context).detailsModel?.website ??
                          "UnKnown",
                      fontSize: 25.sp,
                      textColor: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
