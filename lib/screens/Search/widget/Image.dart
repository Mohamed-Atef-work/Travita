import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/button/DefaultOutlindedButton.dart';
import '../controller/controller.dart';

class SearchImageWidget extends StatelessWidget {
  const SearchImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Image.file(
          SearchImageController.get(context).searchImage!,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          fit: BoxFit.contain,
        ),
        DefaultOutlinedButton(
          onPressed: () {
            SearchImageController.get(context).upLoadImage();
          },
          text: "Search",
          borderRadius: 30,
          width: 100,
          height: 40,
          backgroundColor: AppColors.darkOrange,
          textColor: AppColors.white,
        ),
      ],
    );
  }
}
