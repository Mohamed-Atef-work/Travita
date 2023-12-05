import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travita/Component/widgets/button/DefaultOutlindedButton.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/screens/AI_plan_survey/controller/controller.dart';

import '../../Component/colors/colors.dart';

class DetermineTheStartPositionScreen extends StatefulWidget {
  const DetermineTheStartPositionScreen({super.key});

  @override
  State<DetermineTheStartPositionScreen> createState() => MapSampleState();
}

class MapSampleState extends State<DetermineTheStartPositionScreen> {
  static double? longitude;
  static double? latitude;

  /// the lat2 and lang2 will be current location or local location
  static double lat = 31.261053668476137;
  static double lang = 32.30693131685257;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, lang),
    zoom: 17.4746,
  );

  GoogleMapController? gmc;

  Set<Marker> firstMarker = {
    Marker(
      onTap: () {
        print("marker 2");
      },
      draggable: true,
      position: LatLng(lat, lang),
      onDragEnd: (LatLng location) {
        longitude = location.longitude;
        latitude = location.latitude;
      },
      markerId: MarkerId("2"),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              markers: firstMarker,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                gmc = controller;
              },
            ),
            DefaultOutlinedButton(
              onPressed: () {
                AIPlanSurveyController.get(context).longitude = longitude!;
                AIPlanSurveyController.get(context).latitude = latitude!;
                print("the latitude =$latitude");
                print("the longitude =$longitude");
                AIPlanSurveyController.get(context)
                    .doneDeterminingStartPosition();
              },
              textColor: AppColors.white,
              width: 100.w,
              height: 50.h,
              backgroundColor: AppColors.darkOrange,
              text: "Done",
            ),
            /*TextButton(
              onPressed: () {
                print("object");
                AppController.get(context).longitude = longitude!;
                AppController.get(context).latitude = latitude!;
                print("the latitude =$latitude");
                print("the longitude =$longitude");

                Navigator.pop(context);
              },
              child: Text("Done"),
            ),*/
          ],
        ),
      ),
    );
  }
}
