import 'package:dio/dio.dart';
import 'package:travita/core/app_constants/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(
          milliseconds: 30000,
        ),
        receiveTimeout: const Duration(
          milliseconds: 30000,
        ),
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => true,
        followRedirects: false,
      ),
    );
  }
  ////////////////////////////////////////////

  static Future<Response> getAIPlan({
    required String endpoint,
  }) async {
    /*dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';*/
    dio!.options.baseUrl = AppConstants.baseUrl;
    dio!.options = BaseOptions(
      headers: {'Authorization': 'Bearer ${AppConstants.accessToken}'},
      connectTimeout: const Duration(
        milliseconds: 30000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 30000,
      ),
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      followRedirects: true,
    );
    return await dio!.get(
      endpoint,
    );
  }

  static Future<Response> getNearestRestaurants({
    required String endpoint,
    required int placeId,
  }) async {
    /*dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';*/
    dio!.options.baseUrl = AppConstants.baseUrl;
    dio!.options = BaseOptions(
      headers: {'Authorization': 'Bearer ${AppConstants.accessToken}'},
      connectTimeout: const Duration(
        milliseconds: 30000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 30000,
      ),
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      followRedirects: true,
    );
    return await dio!.post(
      data: {
        "place_id": placeId,
      },
      endpoint,
    );
  }

  /////////////////////////////////////////////
  static Future<Response> getManualPlan({
    required String endpoint,
    required int tripId,
  }) async {
    /*dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';*/
    dio!.options.baseUrl = AppConstants.baseUrl;
    dio!.options = BaseOptions(
      headers: {'Authorization': 'Bearer ${AppConstants.accessToken}'},
      connectTimeout: const Duration(
        milliseconds: 30000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 30000,
      ),
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      followRedirects: true,
    );
    return await dio!.post(
      data: {
        "trip_id": tripId,
      },
      endpoint,
    );
  }
  /////////////////////////////////////////////

  static Future<Response> getFavoriteData() async {
    dio!.options.baseUrl = AppConstants.baseUrl;
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    return await dio!.get(
      "favorites",
    );
  }

  static Future<Response> postFavorite({
    required Map<String, dynamic> data,
  }) async {
    dio!.options.baseUrl = AppConstants.baseUrl;
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    return await dio!.post(
      "favorites",
      data: data,
    );
  }

  static Future<Response> deleteFavorite({
    required String favoriteType,
    required String id,
  }) async {
    dio!.options.baseUrl = AppConstants.baseUrl;
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    return await dio!.delete(
      "favorites/$favoriteType/$id",
    );
  }

  //////////////////////////////////////////////

  static Future<Response> getSurveyData() async {
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    dio!.options.baseUrl = AppConstants.surveyUrl;
    return await dio!.get(
      "survey",
    );
  }

  static Future<Response?> sendSurveyRate({
    required String imageId,
    required String rate,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    dio!.options.baseUrl = AppConstants.surveyUrl;

    return await dio!.post(
      "survey",
      data: {
        "img_id": imageId,
        "rate": rate,
      },
    );
  }

  //////////////////////////////////////////////

  static Future<Response?> createManualTrip({
    required String tripName,
    required String endPoint,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    dio!.options.baseUrl = AppConstants.baseUrl;

    return await dio!.post(
      endPoint,
      data: {
        "name": tripName,
      },
    );
  }

  static Future<Response?> putPlacesInTrip({
    required int tripId,
    required int placeId,
    required String placeType,
    required String endPoint,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    dio!.options.baseUrl = AppConstants.baseUrl;

    return await dio!.post(
      endPoint,
      data: {
        "trip_id": tripId,
        "trippable_type": placeType,
        "trippable_id": placeId,
      },
    );
  }

  static Future<Response?> getTrips({
    required String endPoint,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    dio!.options.baseUrl = AppConstants.baseUrl;

    return await dio!.get(
      endPoint,
    );
  }

  //////////////////////////////////////////////
  static Future<Response?> uploadSearchImageLink({
    required String imageLink,
    required String endpoint,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';
    dio!.options.baseUrl = AppConstants.baseUrl;

    return await dio!.post(
      data: {
        "image": imageLink,
      },
      endpoint,
    );
  }

  static Future<Response?> getSearchResult({
    required String endpoint,
  }) async {
    dio!.options = BaseOptions(
      headers: {'Authorization': 'Bearer ${AppConstants.accessToken}'},
      connectTimeout: const Duration(
        milliseconds: 30000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 30000,
      ),
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      followRedirects: true,
    );
    /*dio!.options.headers['Authorization'] =
        'Bearer ${AppConstants.accessToken}';*/
    dio!.options.baseUrl = AppConstants.baseUrl;

    return await dio!.get(
      endpoint,
    );
  }
  //////////////////////////////////////////////

  static Future<Response> getData({
    required String baseUrl,
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.baseUrl = baseUrl;
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response?> postData({
    required String url,
    required String baseUrl,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.baseUrl = baseUrl;

    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = "en",
    String? token,
  }) async {
    dio?.options.headers = {
      "lang": lang,
      "Authorization": token ?? "",
    };

    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
