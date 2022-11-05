import 'dart:developer';

import 'package:amazon_clone/config/app_config.dart';
import 'package:amazon_clone/config/app_exceptions.dart';
import 'package:amazon_clone/constants/api_endpoints.dart';
import 'package:amazon_clone/constants/app_urls.dart';
import 'package:amazon_clone/helpers/preference_manager.dart';
import 'package:amazon_clone/model/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Future<SignUpModel?> signUp(SignUpModel signUpModel) async {
    try {
      Dio dio = Dio();

      const url = AppUrls.baseUrl + ApiEndpoints.signUp;
      Response response = await dio.post(
        url,
        data: signUpModel.toJson(),
        options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return SignUpModel.fromJson(response.data);
      } else {
        log("Error with status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<String?> signIn(String email, String password) async {
    try {
      Dio dio = Dio();
      const url = AppUrls.baseUrl + ApiEndpoints.signIn;

      Response response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        PreferenceManager manager =
            PreferenceManager(await SharedPreferences.getInstance());
        manager.token = response.data["token"];
        log(response.data.toString());
        return response.data["message"];
      } else {
        log("Error with status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<String?> getUserData() async {
    try {
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      final token = manager.accessToken;
      if (token != null) {
        return token;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
