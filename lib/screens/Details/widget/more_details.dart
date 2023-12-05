import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../google_map/view_googleMap.dart';

class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late final List<String> details = [
      "Name",
      "Description",
      "Address",
      "Website",
      "Phone",
      "Rate",
    ];
    late final List<String> detailsData = [
      AppController.get(context).detailsModel!.name,
      AppController.get(context).detailsModel!.description ?? "UnKnown",
      AppController.get(context).detailsModel!.address ?? "UnKnown",
      AppController.get(context).detailsModel!.website ?? "UnKnown",
      AppController.get(context).detailsModel!.phone ?? "UnKnown",
      "${AppController.get(context).detailsModel!.rating} Stars",
    ];
/*    late final List onTaps = [
      () {},
      () {},
      () {},
      () {
        String webSite = 'google.com';
        _launchUrl(Uri _url) async {
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }
        }

        final Uri _url = Uri.parse(webSite);
        _launchUrl(_url);
      },
      () {},
      () {
        defaultNavigator(
          context,
          GoogleMapScreen(
            lt: 31.260976,
            lg: 32.306976,
          ),
        );
      },
      () {
        String webSite = 'google.com';
        _launchUrl(Uri _url) async {
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }
        }

        final Uri _url = Uri.parse(webSite);
        _launchUrl(_url);
      },
    ];*/
    return Padding(
      padding: EdgeInsets.only(
        top: 15.r,
        right: 15.r,
        left: 15.r,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.w,
            child: const Divider(
              height: 0,
              color: AppColors.ofBlue,
              thickness: .5,
              indent: 60,
              endIndent: 60,
            ),
          ),
          itemCount: details.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: "${details[index]} :",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                textColor: AppColors.darkGrey,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Align(
                  alignment: Alignment.center,
                  child: DefaultText(
                    text: detailsData[index],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
