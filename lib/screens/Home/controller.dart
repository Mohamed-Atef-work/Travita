import 'package:dio/dio.dart';
import 'package:travita/core/app_constants/constants.dart';
import 'package:travita/core/database/remote/dioHelper/endpoints.dart';
import 'package:travita/screens/Home/testingModel.dart';

import '../../core/database/remote/dioHelper/dioHelper.dart';
import '../Places_of_type/Models/restaurantsModel.dart';

class HomeController {
  Future<DetailsModel> getData() async {
    var response = await Dio().get(AppConstants.baseUrl + ATTRACTIONS);
    Map<String, dynamic> apiMap = response.data;
    return DetailsModel.fromJsonAttraction(apiMap);
  }

  late final List<String> vector = [
    "image/Vector4.png",
    "image/Vector3.png",
    "image/Vector2.png",
    "image/Vector1.png",
  ];
  late final List<String> titles = [
    "Attractions",
    "Hotels",
    "Coffee Shops",
    "Restaurants",
  ];
}
