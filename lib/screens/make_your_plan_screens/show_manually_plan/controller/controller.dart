import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';
import 'package:travita/screens/make_your_plan_screens/show_manually_plan/controller/states.dart';

import '../../../../core/database/remote/dioHelper/endpoints.dart';
import '../../../Favourite/models.dart';

class ShowManualPlanController extends Cubit<ShowTripStates> {
  ShowManualPlanController() : super(ShowTripInitial());
  static ShowManualPlanController get(context) => BlocProvider.of(context);

  late final FavoritesModel places;

  void getTripPlaces({
    required int tripId,
  }) {
    emit(GetTripLoading());
    DioHelper.getManualPlan(endpoint: SHOW_TRIP_PLACES, tripId: tripId)
        .then((value) {
      places = FavoritesModel.fromJson(value.data);
      emit(GetTripSuccess());
    }).catchError((error) {
      print("The error is --------------------> ${error.toString()}");
      emit(GetTripError());
    });
  }
}
