import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/controller/states.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/models/trip_model.dart';

import '../../../../Component/colors/colors.dart';
import '../../../../Component/widgets/defaultText.dart';
import '../../../../core/database/remote/dioHelper/dioHelper.dart';
import '../../../../core/database/remote/dioHelper/endpoints.dart';

class MorePlacesController extends Cubit<MorePlaces> {
  MorePlacesController() : super(MorePlacesInitial());
  static MorePlacesController get(context) => BlocProvider.of(context);

  late DetailsModel placeDetails;

  TripsModel? tripsModel;
  List<bool>? isCheckedItems = [];
  late Color borderColor = AppColors.blue;
  void noTripNameFound(BuildContext context) {
    borderColor = Colors.red;
    emit(NoTripNameFound());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultText(
          text: "Where is the trip name ?",
          textAlign: TextAlign.center,
        ),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  late final TextEditingController createTripController =
      TextEditingController();
  late final GlobalKey<FormState> createTripFormKey = GlobalKey<FormState>();

  void getAllTrips() {
    DioHelper.getTrips(endPoint: TRIP).then((value) {
      tripsModel = TripsModel.fromJson(value!.data);
      print(tripsModel!.trips[0].name);
      isCheckedItems =
          List.generate(tripsModel!.trips.length, (index) => false);
      emit(GetTripsSuccess());
    }).catchError((error) {
      print("Getting all trips error -------------------->${error.toString()}");
      emit(GetTripsError());
    });
  }

  void chooseTripToPutPlace({required int index}) {
    isCheckedItems![index] = !isCheckedItems![index];
    emit(ChooseTrip());
  }

  void goCreatePlan() {
    emit(GoToCreateNewPlan());
  }

  void createTrip(BuildContext context) {
    if (createTripController.text.isNotEmpty) {
      emit(CreateTripeLoading());
      DioHelper.createManualTrip(
        endPoint: TRIP,
        tripName: createTripController.text,
      ).then((value) {
        getAllTrips();
        emit(CreateTripeSuccess());
      }).catchError((error) {
        emit(CreateTripeError());
      });
    } else {
      noTripNameFound(context);
    }
  }

  Future<void> putPlaceInMoreThanOneTrip({
    required int placeId,
    required String placeType,
  }) async {
    emit(PutPlacesInTripLoading());
    for (int tripIndex = 0; tripIndex < isCheckedItems!.length; tripIndex++) {
      if (isCheckedItems![tripIndex] == true) {
        putPlaceInOneTrip(
          placeId: placeId,
          placeType: placeType,
          tripId: tripsModel!.trips[tripIndex].id,
          tripIndex: tripIndex,
        );
      }
    }
  }

  void ensureAllIsAdded() {
    for (bool isChecked in isCheckedItems!) {
      if (isChecked == true) {
        numOfErrors++;
      }
    }

    print("ensure ------------------> ensure");

/*    for (int i = 0; i < isCheckedItems!.length; i++) {
      if (isCheckedItems![i] == true) {
        print("true ------------------> true");
      }
    }*/
    if (numOfErrors == 0) {
      print("All ------------------> is added");
      emit(PutPlacesInTripSuccess());
    }
  }

  late int numOfErrors = 0;

  void putPlaceInOneTrip({
    required int tripId,
    required int placeId,
    required String placeType,
    required int tripIndex,
  }) {
    //currentPutIndex++;
    print("Loading ------------------> Loading");
    //emit(PutPlacesInTripLoading());
    DioHelper.putPlacesInTrip(
      tripId: tripId,
      placeId: placeId,
      placeType: placeType,
      endPoint: TRIP_PLACES,
    ).then((value) {
      /*if (currentPutIndex == isCheckedItems!.length - 1) {
        emit(DoneAddingPlaces());
      }*/
      /*if (isCheckedItems![tripIndex] == isCheckedItems!.last) {
        print("condition ------------------> condition");

        ensureAllIsAdded();
      }*/
      print("Then ------------------> Then");
      isCheckedItems![tripIndex] = false;
      numOfErrors--;
      print(isCheckedItems);
      ensureAllIsAdded();
    }).catchError((error) {
      numOfErrors++;
      print(
          "putPlaceInOneTrip error is ------------------> ${error.toString()}");
      emit(PutPlacesInTripError());
    });
  }
}
