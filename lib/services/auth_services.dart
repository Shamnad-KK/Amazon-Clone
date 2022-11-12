import 'dart:developer';

import 'package:amazon_clone/config/app_config.dart';
import 'package:amazon_clone/config/app_exceptions.dart';
import 'package:amazon_clone/constants/api_endpoints.dart';
import 'package:amazon_clone/constants/app_urls.dart';
import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:amazon_clone/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Future<UserModel?> signUp(UserModel signUpModel) async {
    try {
      Dio dio = Dio();

      const url = AppUrls.baseUrl + ApiEndpoints.signUp;
      final response = await dio.post(
        url,
        data: signUpModel.toJson(),
        options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return UserModel.fromJson(response.data);
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
      AuthController authController = Get.find();
      const url = AppUrls.baseUrl + ApiEndpoints.signIn;

      final response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final sharedPreferences = await SharedPreferences.getInstance();
        log(response.data.toString());
        authController.setUser(UserModel.fromJson(response.data));
        await sharedPreferences.setString(
          "x-auth-token",
          response.data["token"],
        );

        // PreferenceManager manager =
        //     PreferenceManager(await SharedPreferences.getInstance());
        // manager.token = response.data["token"];
        // log(response.data.toString());
        return response.data["message"].toString();
      } else {
        log("Error with status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<UserModel?> getUserData() async {
    try {
      Dio dio = Dio();
      final preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("x-auth-token");
      if (token == null) {
        log("token setted");
        await preferences.setString("x-auth-token", '');
      }
      log("This is token : ${token.toString()}");
      const url = AppUrls.baseUrl + ApiEndpoints.token;

      final tokenResponse = await dio.post(
        url,
        options: Options(
          headers: {
            'content-type': 'application/json',
            'cccept': 'application/json',
            "x-auth-token": token
          },
        ),
      );

      //Taking the result to a variable which is a type of bool from the API response

      if (tokenResponse.statusCode! >= 200 &&
          tokenResponse.statusCode! <= 299) {
        final isTokenValid = tokenResponse.data["result"];

        log(tokenResponse.data.toString());
        //Checking if the token is valid or not.If it's valid then only we want to fetch data
        if (isTokenValid == true) {
          //Get user data from Api
          const url = AppUrls.baseUrl + ApiEndpoints.userData;
          final userResponse = await dio.get(
            url,
            options: Options(
              headers: {
                'Content-type': 'application/json',
                'Accept': 'application/json',
                "x-auth-token": token
              },
            ),
          );

          if (userResponse.statusCode! >= 200 &&
              userResponse.statusCode! <= 299) {
            log("nthada $isTokenValid");
            return UserModel.fromJson(userResponse.data);
          }
        }
      }

      // PreferenceManager manager =
      //     PreferenceManager(await SharedPreferences.getInstance());
      // final token = manager.accessToken;
      // if (token != null) {
      //   return token;
      // }
      return null;
    } catch (e) {
      log(e.toString());
      AppExceptions.handleError(e);
    }
    return null;
  }
}
