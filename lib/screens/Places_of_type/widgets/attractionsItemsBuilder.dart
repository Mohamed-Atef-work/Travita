import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/core/app_controller/appController.dart';

import '../../../Component/navigator.dart';
import '../../../Component/widgets/category/category.dart';
import '../../Details/view.dart';
import '../Models/restaurantsModel.dart';

class AttractionsItemsBuilder extends StatelessWidget {
  late final PlacesModel placesModel;

  AttractionsItemsBuilder({
    required this.placesModel,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: placesModel.data!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 2.w / 2.6.h,
      ),
      itemBuilder: (BuildContext context, int index) => Category(
        onTap: () {
          AppController.get(context).detailsModel = placesModel.data![index];
          AppController.get(context).detailsModels = placesModel.data;
          defaultNavigator(
            context,
            const DetailsScreen(),
          );
        },
        detailsModel: placesModel.data![index],
      ),
    );
  }
}
