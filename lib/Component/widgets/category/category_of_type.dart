// ignore_for_file: must_be_immutable

/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/defaultText.dart';

import '../../colors/colors.dart';
import '../../../UI/Details/view.dart';

class CategoryOfTypeThePlace extends StatefulWidget {
  String image;
  String nameOfPlace;
  String description;
  bool showIcon;
  late final String type;
  late final String id;

  CategoryOfTypeThePlace({
    required this.image,
    required this.nameOfPlace,
    required this.description,
    required this.showIcon,
    required this.type,
    required this.id,
  });

  @override
  State<CategoryOfTypeThePlace> createState() => _CategoryOfTypeThePlaceState();
}

class _CategoryOfTypeThePlaceState extends State<CategoryOfTypeThePlace> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    detailsType: widget.type,
                    detailsId: widget.id,
                    image: widget.image,
                    name: widget.nameOfPlace,
                    description: widget.description,
                  )),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 175.w,
            height: 131.h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 20.w,
                  child: widget.showIcon
                      ? Icon(
                          Icons.favorite_border,
                          color: AppColors.white,
                          size: 20,
                        )
                      : Row(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultText(
            text: widget.nameOfPlace,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(
            height: 4.h,
          ),
          DefaultText(
            text: widget.description,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColors.darkGrey,
            maxLines: widget.showIcon ? 3 : 5,
            textOverflow: TextOverflow.ellipsis,
          ),
          widget.showIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: AppColors.darkOrange,
                    ),
                    GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 3,
                                decoration: const BoxDecoration(
                                  color: AppColors.darkBlue,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: 0.h,
                                        ),
                                        itemCount: 7,
                                        itemBuilder: (context, index) =>
                                            CheckboxListTile(
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => BorderSide(
                                                      width: .5,
                                                      color: Colors.white),
                                                ),
                                                activeColor:
                                                    AppColors.darkOrange,
                                                checkColor: AppColors.white,
                                                secondary: SizedBox(
                                                  width: 40,
                                                  height: 50,
                                                  child: Image.asset(
                                                      "image/fav.jpg"),
                                                ),
                                                title: DefaultText(
                                                  text: 'Cairo',
                                                  textColor: AppColors.white,
                                                ),
                                                subtitle: DefaultText(
                                                  text: '3 Saved',
                                                  textColor: AppColors.white,
                                                )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.darkOrange,
                        )),
                  ],
                )
              : Row(),
        ],
      ),
    );
  }
}*/
