import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/Search/controller/states.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';
import 'package:travita/core/database/remote/dioHelper/endpoints.dart';

class SearchImageController extends Cubit<SearchStates> {
  SearchImageController() : super(SearchInitial());
  static SearchImageController get(context) => BlocProvider.of(context);
  late final FirebaseStorage fireStorage = FirebaseStorage.instance;
  late final TextEditingController searchController = TextEditingController();

  String? imageUrl;
  File? searchImage;
  PlacesModel? searchResult;
  List<List<List<Map<String, dynamic>?>>>? searchResultList;

  Future<void> getSearchImage() async {
    //emit(GetProfileImageLocalLoadingState());
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      searchImage = File(
        pickedImage.path,
      );
      emit(GetImageSuccess());
    } else {
      print("--------->No image selected");
      //emit(GetProfileImageLocalErrorState());
    }
  }

  void upLoadImage() {
    emit(UpLoadImageLoading());
    fireStorage
        .ref()
        .child("SearchImages/${Uri.file(searchImage!.path).pathSegments.last}")
        .putFile(searchImage!)
        .then((value) {
      value.ref.getDownloadURL().then((searchImageUrl) {
        imageUrl = searchImageUrl;
        print(imageUrl);
        //////
        emit(UpLoadImageSuccess());
        uploadImageLink(imageLink: searchImageUrl);
        //////
      }).catchError((error) {
        emit(UpLoadImageError());
      });
    }).catchError((bigError) {
      emit(UpLoadImageError());
    });
  }

  void uploadImageLink({
    required String imageLink,
  }) {
    emit(UpLoadImageLinkLoading());
    print(imageLink);
    DioHelper.uploadSearchImageLink(
            imageLink: imageLink, endpoint: SEARCH_IMAGE)
        .then((value) {
      searchImage = null;
      ////////////
      emit(UpLoadImageLinkSuccess());
      getSearchResult();
      ///////////
    }).catchError((error) {
      print("UploadImageLinkError is ---------------> ${error.toString()}");
      emit(UpLoadImageLinkError());
    });
  }

  void getSearchResult() {
    emit(GetSearchResultLoading());
    DioHelper.getSearchResult(endpoint: SEARCH_RESULT).then((value) {
      print("Status Code is ----------->${value!.statusCode}");
      searchResult = PlacesModel.fromJsonSearchResult(value.data);
      print("The id is -------------> ${searchResult!.data[0].name}");
      emit(GetSearchResultSuccess());
    }).catchError((error) {
      print("GetSearchResultError is ---------------->${error.toString()}");
      emit(GetSearchResultError());
    });
  }
}
