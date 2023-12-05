import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travita/core/app_constants/constants.dart';

import '../../screens/Favourite/models.dart';
import '../../screens/Places_of_type/Models/restaurantsModel.dart';
import '../../screens/REGISTERATION/model.dart';
import '../database/remote/dioHelper/dioHelper.dart';
import '../database/remote/dioHelper/endpoints.dart';
import 'appStates.dart';

class AppController extends Cubit<AppStates> {
  AppController() : super(AppInitialState());

  static AppController get(context) => BlocProvider.of(context);
  late final GoogleSignIn googleSignIn = GoogleSignIn();

  late final UserModel userModel;

  void googleLogin({
    required BuildContext context,
  }) {
    emit(LoginGoogleLoadingState());
    googleSignIn.signIn().then((value) {
      AppConstants.name = value!.displayName!;
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }

  void logIn({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      baseUrl: AppConstants.baseUrlAuth,
      url: LOGIN,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value!.data);
      AppConstants.accessToken = userModel.accessToken;
      AppConstants.name = userModel.user.firstName;
      print(AppConstants.accessToken);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  bool isValidPassword({required String password}) {
    // Check the length of the input.
    if (password.length < 8) {
      return false;
    }

    // Check if the password contains only alphabets.
    final isAlphabetic = RegExp(r'^[a-zA-Z]+$').hasMatch(password);
    if (isAlphabetic) {
      return false;
    }

    // Check if the password contains only digits.
    final isNumeric = int.tryParse(password) != null;
    if (isNumeric) {
      return false;
    }

    // All conditions passed, so the passwordController.text is valid.
    return true;
  }

  bool isValidEmail({required String email}) {
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return regex.hasMatch(email);
  }

  void changePasswordVisibility() {
    emit(ChangVisibilityState());
  }

  void formFieldIsNotValid() {
    emit(NotValidState());
  }

  //////////////////////////////////////////
  // favorite

  FavoritesModel? favoritesModel;

  void getFavorite() {
    emit(GetFavoritesLoading());

    DioHelper.getFavoriteData().then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(GetFavoritesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesError());
    });
  }

  void putInFavorite({
    required String type,
    required String id,
  }) {
    emit(PutInFavoritesLoading());
    if (!checkIfExisted(
      type: type,
      id: id,
    )) {
      DioHelper.postFavorite(data: {
        "favoritable_id": id,
        "favoritable_type": type,
      }).then((value) {
        emit(PutInFavoritesSuccess());
        getFavorite();
      }).catchError((error) {
        print(error.toString());
        emit(PutInFavoritesError());
      });
    } else {
      emit(PutInFavoritesAlreadyExisted());
    }
  }

  bool checkIfExisted({
    required String type,
    required String id,
  }) {
    bool isIn = false;
    if (favoritesModel != null &&
        favoritesModel!.data.allFavorites.isNotEmpty) {
      for (DetailsModel favoriteItem in favoritesModel!.data.allFavorites) {
        if (favoriteItem.id.toString() == id &&
            favoriteItem.favoriteType == type) {
          print(
              "The length is -----------------------------------> ${favoritesModel!.data.allFavorites.length}");
          print("-----------------------------------> Existed");
          isIn = true;
          break;
        }
      }
    } else {
      print("-----------------------------------> Not Existed");
    }

    return isIn;
  }

  void deleteFromFavorite({
    required String favoriteType,
    required String id,
  }) {
    emit(DeleteFromFavoritesLoading());
    DioHelper.deleteFavorite(
      favoriteType: favoriteType,
      id: id,
    ).then((value) {
      emit(DeleteFromFavoritesSuccess());
      getFavorite();
    }).catchError((error) {
      print(error.toString());

      emit(DeleteFromFavoritesError());
    });
  }

  void changeFavoriteIcon() {
    emit(ChangeFavoriteIcons());
  }

  ///////////////////////////////////
  // details

  DetailsModel? detailsModel;
  List<DetailsModel>? detailsModels;
  bool? isFavorite = false;

  void newDetails({
    required int index,
  }) {
    isFavorite = null;
    emit(DetailsNewItem());
    detailsModel = detailsModels![index];
    check();
    emit(DetailsNewItem());
  }

  void check() {
    isFavorite = checkIfExisted(
      type: detailsModel!.favoriteType!,
      id: detailsModel!.id.toString(),
    );
  }

  Future<void> checkIfDetailsExisted() async {
    isFavorite = checkIfExisted(
      type: detailsModel!.favoriteType!,
      id: detailsModel!.id.toString(),
    );
  }
  ////////////
  // AIPlane

  late double longitude;
  late double latitude;
}
