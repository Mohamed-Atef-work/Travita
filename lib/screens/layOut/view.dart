import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Component/colors/colors.dart';
import 'cubit/controller.dart';
import 'cubit/states.dart';

class LayOutScreen extends StatelessWidget {
  LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayOutController>(
      create: (context) => LayOutController(),
      child: BlocConsumer<LayOutController, LayOutStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: LayOutController.get(context)
              .screens[LayOutController.get(context).selectedIndex],
          bottomNavigationBar: CurvedNavigationBar(
            items: [
              Icon(
                Icons.search,
                size: 30.r,
                color: AppColors.white,
              ),
              Icon(
                Icons.pending_actions_rounded,
                size: 30.r,
                color: AppColors.white,
              ),
              Icon(
                Icons.home,
                size: 30.r,
                color: AppColors.white,
              ),
              Icon(
                Icons.favorite,
                size: 30.r,
                color: AppColors.white,
              ),
              Icon(
                Icons.person,
                size: 30.r,
                color: AppColors.white,
              ),
            ],
            index: LayOutController.get(context).selectedIndex,
            onTap: (int index) {
              LayOutController.get(context).changeBottomNav(index: index);
            },
            height: 60.h,
            color: AppColors.darkBlue,
            buttonBackgroundColor: AppColors.darkOrange,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
