import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/make_your_plan_screens/make_your_plan/controller/states.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';
import 'package:travita/core/database/remote/dioHelper/endpoints.dart';

import '../../../../core/app_constants/constants.dart';

class MakeYourPlanController extends Cubit<MakeYourPlanStates> {
  MakeYourPlanController() : super(MakeYourPlanInitial());
  static MakeYourPlanController get(context) => BlocProvider.of(context);
  late final List<String> placesTypes = [
    "Attractions",
    "Hotels",
    "Restaurants",
  ];
  PlacesModel? attractions;
  PlacesModel? hotels;
  PlacesModel? restaurant;
  void getAttractions({
    Map<String, String>? query,
  }) {
    DioHelper.getData(
      baseUrl: AppConstants.baseUrl,
      url: "attractions",
      query: query,
    ).then((value) {
      attractions = PlacesModel.fromJsonAttraction(value.data);
      emit(DataSuccess());
    }).catchError((error) {
      print("The error is -----------> ${error.toString()}");
      emit(DataError());
    });
  }

  void getRestaurant() {
    DioHelper.getData(
      url: "restaurants",
      baseUrl: AppConstants.baseUrl,
    ).then((value) {
      restaurant = PlacesModel.fromJsonRestaurants(value.data);
      emit(DataSuccess());
    }).catchError((error) {
      print("The error is -----------> ${error.toString()}");
      emit(DataError());
    });
  }

  void getHotels() {
    DioHelper.getData(
      url: "hotels",
      baseUrl: AppConstants.baseUrl,
    ).then((value) {
      hotels = PlacesModel.fromJsonHotels(value.data);
      emit(DataSuccess());
    }).catchError((error) {
      print("The error is -----------> ${error.toString()}");
      emit(DataError());
    });
  }

  void getData() {
    getAttractions();
    getHotels();
    getRestaurant();
  }
}
