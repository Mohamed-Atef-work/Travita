import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/show_AI_plan/controller/controller.dart';
import 'package:travita/screens/show_AI_plan/controller/states.dart';
import 'package:travita/screens/show_AI_plan/widgets/all_days.dart';

class ShowAIPlanScreen extends StatelessWidget {
  const ShowAIPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowAIPlanController>(
      create: (context) => ShowAIPlanController()..getAIPlan(),
      child: Scaffold(
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
        body: BlocConsumer<ShowAIPlanController, ShowAIPlanStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetAIPlanSuccess) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  right: 20.w,
                  left: 20.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// image
                      Image.asset(
                        "image/plan.png",
                        width: 364.w,
                        height: 242.h,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      /// text
                      DefaultText(
                        text:
                            "Based on your interests and budget, we offer you this plan, knowing that you can modify them ",
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                        textColor: AppColors.darkBlue,
                      ),

                      /// plan
                      AllDaysAIPlanWidget(
                        aIPlan: ShowAIPlanController.get(context).plan,
                      ),
                      /*ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Day $index',
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              textColor: AppColors.darkBlue,
                            ),
                            //PlaceAIPlanWidget(),
                            const Divider(
                              color: AppColors.darkBlue,
                              thickness: .5,
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        itemCount: 6,
                      ),*/
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
