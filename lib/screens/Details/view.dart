import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_controller/appController.dart';
import '../../core/app_controller/appStates.dart';
import 'widget/category_for_you.dart';
import 'widget/discription.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Image.asset(
          "image/appBarLogo.png",
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: FutureBuilder(
            future: AppController.get(context).checkIfDetailsExisted(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // The play() method has finished executing
                return BlocConsumer<AppController, AppStates>(
                  buildWhen: (currentState, previousState) =>
                      currentState is DetailsNewItem,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (AppController.get(context).isFavorite != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  //alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.2,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            child: AppController.get(context)
                                                        .detailsModel!
                                                        .image ==
                                                    null
                                                ? Image.asset(
                                                    "image/appBarLogo.png",
                                                    fit: BoxFit.cover,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                  )
                                                : Image.network(
                                                    AppController.get(context)
                                                        .detailsModel!
                                                        .image!,
                                                    fit: BoxFit.cover,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                  ),
                                          ),
                                          BlocConsumer<AppController,
                                              AppStates>(
                                            buildWhen: (previousState,
                                                    currentState) =>
                                                currentState
                                                    is! GetFavoritesLoading &&
                                                currentState
                                                    is! GetFavoritesSuccess &&
                                                currentState
                                                    is! GetFavoritesError,
                                            listener: (context, state) {
                                              if (state
                                                  is PutInFavoritesError) {
                                                AppController.get(context)
                                                    .isFavorite = false;
                                              }
                                              if (state
                                                  is DeleteFromFavoritesError) {
                                                AppController.get(context)
                                                    .isFavorite = true;
                                              }
                                            },
                                            builder: (context, state) {
                                              if (!AppController.get(context)
                                                  .isFavorite!) {
                                                return IconButton(
                                                  onPressed: () {
                                                    if (state
                                                            is! PutInFavoritesLoading &&
                                                        state
                                                            is! DeleteFromFavoritesLoading) {
                                                      AppController.get(context)
                                                              .isFavorite =
                                                          !AppController.get(
                                                                  context)
                                                              .isFavorite!;
                                                      AppController.get(context)
                                                          .putInFavorite(
                                                        type: AppController.get(
                                                                context)
                                                            .detailsModel!
                                                            .favoriteType!,
                                                        id: AppController.get(
                                                                context)
                                                            .detailsModel!
                                                            .id
                                                            .toString(),
                                                      );
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .favorite_outline_outlined,
                                                    color: Colors.red,
                                                  ),
                                                );
                                              } else {
                                                return IconButton(
                                                  onPressed: () {
                                                    if (state
                                                            is! PutInFavoritesLoading &&
                                                        state
                                                            is! DeleteFromFavoritesLoading) {
                                                      AppController.get(context)
                                                          .isFavorite = false;
                                                      AppController.get(context)
                                                          .deleteFromFavorite(
                                                        favoriteType:
                                                            AppController.get(
                                                                    context)
                                                                .detailsModel!
                                                                .favoriteType!,
                                                        id: AppController.get(
                                                                context)
                                                            .detailsModel!
                                                            .id
                                                            .toString(),
                                                      );
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Description(
                                  placeName: AppController.get(context)
                                      .detailsModel!
                                      .name,
                                  description: AppController.get(context)
                                          .detailsModel!
                                          .description ??
                                      AppController.get(context)
                                          .detailsModel!
                                          .address!,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              "Just for you",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 230.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                              itemCount: AppController.get(context)
                                  .detailsModels!
                                  .length,
                              itemBuilder: (context, index) => DetailsCategory(
                                onTap: () {
                                  AppController.get(context).newDetails(
                                    index: index,
                                  );
                                },
                                text: AppController.get(context)
                                    .detailsModels![index]
                                    .name,
                                image: AppController.get(context)
                                    .detailsModels![index]
                                    .image,
                              ),
                            ),
                          ),
                          /*Text(
                            "Comments ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),*/
                          /*ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 15.h,
                        ),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) =>
                            Comment(
                          image: "image/fav.jpg",
                          name: "Ahmed",
                          comment:
                              "This palce is one of the most beautiful places in the world",
                        ),
                      ),*/
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              } else {
                // Show a loading indicator while the play() method is executing
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
