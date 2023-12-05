
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/Search/controller/controller.dart';

import '../../../Component/colors/colors.dart';

class SearchFormField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String hintText;

  const SearchFormField({
    super.key,
    required this.width,
    required this.height,
    required this.controller,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        style: const TextStyle(color: AppColors.black),
        cursorColor: AppColors.darkOrange,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.search, color: AppColors.darkOrange),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.camera_alt_outlined, color: AppColors.darkOrange),
            onPressed: () {
              SearchImageController.get(context).getSearchImage();
            },
          ),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.darkOrange)),
          contentPadding: EdgeInsets.only(left: 10.w, right: 10.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: AppColors.grey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
        ),
      ),
    );
  }
}
