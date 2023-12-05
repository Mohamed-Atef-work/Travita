import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/Favourite/view.dart';
import 'package:travita/screens/layOut/cubit/states.dart';

import '../../../core/app_constants/constants.dart';
import '../../../core/database/remote/dioHelper/dioHelper.dart';
import '../../Home/view.dart';
import '../../Places_of_type/Models/restaurantsModel.dart';
import '../../Profile/profile.dart';
import '../../Search/view_search.dart';
import '../../choose_Ai_or_manual_plan/view.dart';

class LayOutController extends Cubit<LayOutStates> {
  LayOutController() : super(HomeLayOutInitialState());

  static LayOutController get(context) => BlocProvider.of(context);

  int selectedIndex = 2;

  void changeBottomNav({
    required int index,
  }) {
    selectedIndex = index;
    emit(ChangBottomNavState());
  }

  PlacesModel? placesModel;

  void getAttractions() {
    if (placesModel == null) {
      emit(LayOutGetDataLoadingState());
      DioHelper.getData(
        baseUrl: AppConstants.baseUrl,
        url: "attractions",
      ).then((value) {
        placesModel = PlacesModel.fromJsonAttraction(value.data);
        emit(LayOutGetDataSuccessState());
      }).catchError((error) {
        print("The error is -----------> ${error.toString()}");
        emit(LayOutGetDataErrorState());
      });
    }
  }

  List<Widget> screens = [
    SearchScreen(),
    ChooseAiOrManualPlanScreen(),
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
}
