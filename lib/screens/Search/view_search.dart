import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/Search/widget/Image.dart';
import 'package:travita/screens/Search/widget/result.dart';
import 'package:travita/screens/Search/widget/search.dart';

import '../../Component/colors/colors.dart';
import 'controller/controller.dart';
import 'controller/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchImageController>(
      create: (context) => SearchImageController(),
      child: BlocConsumer<SearchImageController, SearchStates>(
        buildWhen: (previous, current) => false,
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 80.h,
                  ),
                  child: SearchFormField(
                    width: 395.w,
                    height: 55.h,
                    controller:
                        SearchImageController.get(context).searchController,
                    hintText: "Search",
                  ),
                ),
                Expanded(
                  child: BlocConsumer<SearchImageController, SearchStates>(
                      buildWhen: (previousState, currentState) => true
                      /*currentState is GetSearchResultLoading ||
                          currentState is GetImageSuccess ||
                          currentState is GetSearchResultSuccess ||
                          currentState is UpLoadImageLinkLoading ||
                          currentState is UpLoadImageLoading*/
                      ,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetImageSuccess) {
                          return SearchImageWidget();
                        } else if (state is GetSearchResultLoading ||
                            state is UpLoadImageLinkLoading ||
                            state is UpLoadImageLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SearchInitial) {
                          return Center(
                            child: DefaultText(
                              text: "Take a photo to search !",
                              fontWeight: FontWeight.bold,
                              fontSize: 23.sp,
                              textColor: AppColors.blue,
                            ),
                          );
                        } else if (state is GetSearchResultSuccess) {
                          return SearchResultWidget();
                        } else {
                          return Center(
                            child: DefaultText(
                              text: "Oops !",
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
