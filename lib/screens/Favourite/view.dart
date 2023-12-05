import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/category/category_of_type_the_favourit.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/core/app_controller/appStates.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            width: 100,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: 'Favourites',
                fontWeight: FontWeight.w700,
                textColor: AppColors.darkBlue,
                fontSize: 32.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.all(8),
                // indicatorPadding: EdgeInsetsGeometry.infinity,
                splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
                /*dividerColor: Colors.blue,*/
                indicatorColor: AppColors.darkOrange,
                labelColor: AppColors.darkOrange,
                unselectedLabelColor: AppColors.darkBlue,
                automaticIndicatorColorAdjustment: false,
                padding: const EdgeInsets.all(0),
                enableFeedback: true,
                // indicatorWeight: 4,
                tabs: [
                  /*DefaultText(
                    text: 'Plans',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    // textColor: AppColors.darkBlue,
                  ),*/
                  DefaultText(
                    text: 'Places',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    // textColor: AppColors.darkBlue,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    /*BlocConsumer<AppController, AppStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is GetFavoritesSuccess,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (AppController.get(context).favoritesModel == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (AppController.get(context).favoritesModel !=
                                null &&
                            AppController.get(context)
                                .favoritesModel!
                                .data
                                .allFavorites
                                .isEmpty) {
                          return Center(
                            child: DefaultText(
                                text: "No favorites",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CategoryOfTypeTheFavourite(
                              onPressed: () {
                                ///////////////////////////////////////////////////////
                                AppController.get(context).detailsModel =
                                    AppController.get(context)
                                        .favoritesModel!
                                        .data
                                        .allFavorites[index];
                                AppController.get(context).detailsModels =
                                    AppController.get(context)
                                        .favoritesModel!
                                        .data
                                        .allFavorites;
                                ///////////////////////////////////////////////////////////
                              },
                              index: index,
                              favoriteItem: AppController.get(context)
                                  .favoritesModel!
                                  .data
                                  .allFavorites[index],
                              */ /*onTap: () {
                              defaultNavigator(context, Details());
                            },*/ /*
                            ),
                            itemCount: AppController.get(context)
                                .favoritesModel!
                                .data
                                .allFavorites
                                .length,
                          );
                        }
                      },
                    ),*/
                    BlocConsumer<AppController, AppStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is GetFavoritesSuccess,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (AppController.get(context).favoritesModel == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (AppController.get(context).favoritesModel !=
                                null &&
                            AppController.get(context)
                                .favoritesModel!
                                .data
                                .allFavorites
                                .isEmpty) {
                          return Center(
                            child: DefaultText(
                                text: "No favorites",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CategoryOfTypeTheFavourite(
                              onPressed: () {},
                              index: index,
                              favoriteItem: AppController.get(context)
                                  .favoritesModel!
                                  .data
                                  .allFavorites[index],
                              /*onTap: () {
                              defaultNavigator(context, Details());
                            },*/
                            ),
                            itemCount: AppController.get(context)
                                .favoritesModel!
                                .data
                                .allFavorites
                                .length,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
