import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/controller/controller.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/widget/show_model_sheet/place_added.dart';
import '../../controller/states.dart';
import 'creat_trip.dart';
import 'initial_model_sheet.dart';
import 'loading_model_sheet.dart';
import 'model_sheet_error.dart';

class BaseModelSheetWidget extends StatelessWidget {
  final DetailsModel placeDetails;
  const BaseModelSheetWidget({
    required this.placeDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MorePlacesController>(
      create: (context) => MorePlacesController()..getAllTrips(),
      child: BlocConsumer<MorePlacesController, MorePlaces>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetTripsSuccess ||
              state is ChooseTrip ||
              state is PutPlacesInTripError ||
              state is DoneAddingPlaces) {
            return InitialModelSheetWidget(
              placeDetails: placeDetails,
            );
          } else if (state is GetTripsError || state is CreateTripeError) {
            return const ModelSheetErrorWidget();
          } else if (state is GoToCreateNewPlan || state is NoTripNameFound) {
            return CreateTripWidget();
          } else if (state is PutPlacesInTripSuccess) {
            return const PlaceAddedWidget();
          } else {
            return const LoadingModelSheetWidget();
          }
        },
      ),
    );
  }
}

// class CheckBoxI extends StatefulWidget {
//   const CheckBoxI({Key? key}) : super(key: key);
//
//   @override
//   State<CheckBoxI> createState() => _CheckBoxIState();
// }
//
// class _CheckBoxIState extends State<CheckBoxI> {
//   bool isChecked =false;
//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       value: isChecked,
//       onChanged: (bool? newValue) {
//         setState(() {
//           isChecked = newValue!;
//         });
//       },
//       activeColor: AppColors.darkOrange,
//       checkColor: AppColors.white,
//
//       side: MaterialStateBorderSide
//           .resolveWith(
//             (states) => BorderSide(
//             width: 1.4,
//             color: AppColors.darkBlue
//         ),
//       ),
//       secondary: SizedBox(
//           width: 40,
//           height: 50,
//           child: Image.asset("image/fav.jpg")),
//       title: DefaultText(
//         text: 'Cairo',
//         textColor: AppColors.darkBlue,
//         fontWeight: FontWeight.bold,
//         textAlign: TextAlign.start,
//       ),
//       subtitle:  DefaultText(
//         text: '3 Saved',
//         textColor: AppColors.darkBlue,
//         textAlign: TextAlign.start,
//       ),
//     );
//   }
// }
