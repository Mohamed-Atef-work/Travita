import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/button/DefaultOutlindedButton.dart';
import 'package:travita/screens/layOut/view.dart';
import 'package:travita/screens/survey/controller/controller.dart';
import 'package:travita/screens/survey/controller/states.dart';
import '../../Component/colors/colors.dart';
import '../../Component/navigate_and_finish.dart';
import '../../Component/widgets/defaultText.dart';
import 'widgets/survey_item.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SurveyController>(
      create: (context) => SurveyController()..getSurvey(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "image/appBarLogo.png",
            width: 100,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: DefaultText(
                    text: "Survey",
                    fontSize: 30.sp,
                    textColor: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.07,
                  child: BlocConsumer<SurveyController, SurveyStates>(
                    listener: (context, state) {},
                    builder: (context, state) =>
                        SurveyController.get(context).placesModel != null
                            ? ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                  height: 0,
                                  color: AppColors.darkBlue,
                                  thickness: .5,
                                ),
                                itemCount: SurveyController.get(context)
                                    .placesModel!
                                    .data
                                    .length,
                                itemBuilder: (context, index) =>
                                    OneCategoryOfSurvey(
                                  surveyDetails: SurveyController.get(context)
                                      .placesModel!
                                      .data[index],
                                  itemIndex: index,
                                ),
                              )
                            : const Center(child: CircularProgressIndicator()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 100.w,
                    vertical: 10.h,
                  ),
                  child: BlocConsumer<SurveyController, SurveyStates>(
                    buildWhen: (p, c) => false,
                    listener: (context, state) {},
                    builder: (context, state) => DefaultOutlinedButton(
                      onPressed: () {
                        SurveyController.get(context)
                            .navigateToLayOut(context: context);
                      },
                      width: 100.w,
                      height: 50.h,
                      backgroundColor: AppColors.darkOrange,
                      text: "Done",
                      textColor: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
