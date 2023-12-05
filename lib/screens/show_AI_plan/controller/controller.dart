import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';
import 'package:travita/screens/show_AI_plan/controller/states.dart';
import 'package:travita/screens/show_AI_plan/models/model.dart';

import '../../../core/database/remote/dioHelper/endpoints.dart';
import '../models/nearest_restaurants_model.dart';

class ShowAIPlanController extends Cubit<ShowAIPlanStates> {
  ShowAIPlanController() : super(ShowAIPlanInitial());

  static ShowAIPlanController get(context) => BlocProvider.of(context);

  late final ShowAIPlanModel plan;

  late final NearestRestaurantsModel restaurantsModel;

  void getAIPlan() {
    emit(GetAIPlanLoading());
    DioHelper.getAIPlan(
      endpoint: PLAN,
    ).then((value) {
      //print();
      print(value.toString());
      plan = ShowAIPlanModel.fromList(value.data);
      for (int i = 0; i < plan.days.length; i++) {
        print(
            "The Name is ---------------------> ${plan.days[i].places[0].name}");
      }
      emit(GetAIPlanSuccess());
    }).catchError((error) {
      print("Erro is ----------------------> ${error.toString()}");
      emit(GetAIPlanError());
    });
  }

  void getNearestRestaurants({
    required int placeId,
  }) {
    emit(GetNearestRestaurantsLoading());
    DioHelper.getNearestRestaurants(
            endpoint: RESTAURANTS_SQUARE, placeId: placeId)
        .then((value) {
      //print(value.data);
      print("Status code is ---------------> ${value.statusCode}");
      restaurantsModel = NearestRestaurantsModel.fromList(value.data);
      emit(GetNearestRestaurantsSuccess());
    }).catchError((error) {
      print("The Error is ----------------> ${error.toString()}");
      emit(GetNearestRestaurantsError());
    });
  }
}
