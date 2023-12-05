import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/Places_of_type/view.dart';

import '../../Component/colors/colors.dart';
import '../../Component/navigator.dart';
import '../../Component/widgets/button/default_button.dart';
import '../../Component/widgets/category/category.dart';
import '../../core/app_controller/appController.dart';
import '../Details/view.dart';
import '../layOut/cubit/controller.dart';
import '../layOut/cubit/states.dart';
import 'controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = HomeController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(
                  'image/search.png',
                  fit: BoxFit.cover,
                ),
              ),
              DefaultButton(
                onPressed: () {},
                width: 184,
                height: 54,
                backgroundColor: AppColors.darkOrange,
                text: "Where to ? ",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                textColor: AppColors.white,
                opacity: .8,
                borderRadius: 20,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    controller.vector.length,
                    (index) => InkWell(
                      onTap: () {
                        defaultNavigator(
                          context,
                          PlacesOfTypeScreen(
                            category: controller.titles[index],
                          ),
                        );
                      },
                      child: Image.asset(
                        controller.vector[index],
                        //width: ,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  height: 2.h,
                  color: AppColors.grey,
                  endIndent: 30.w,
                  indent: 30.w,
                  thickness: 5.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                DefaultText(
                  text: "Recommended Places",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.darkBlue,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: BlocProvider<LayOutController>(
                    create: (context) => LayOutController()..getAttractions(),
                    child: BlocConsumer<LayOutController, LayOutStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is LayOutGetDataLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is LayOutGetDataSuccessState) {
                          return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: LayOutController.get(context)
                                .placesModel!
                                .data
                                .length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 2.w / 2.6.h,
                            ),
                            itemBuilder: (context, index) => Category(
                              onTap: () {
                                AppController.get(context).detailsModel =
                                    LayOutController.get(context)
                                        .placesModel!
                                        .data[index];
                                AppController.get(context).detailsModels =
                                    LayOutController.get(context)
                                        .placesModel!
                                        .data;
                                defaultNavigator(
                                  context,
                                  const DetailsScreen(),
                                );
                              },
                              detailsModel: LayOutController.get(context)
                                  .placesModel!
                                  .data[index],
                            ),
                          );
                        } else {
                          return Center(
                            child: DefaultText(text: "Oops !"),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
