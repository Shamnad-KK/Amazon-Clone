import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:amazon_clone/common/utils/app_popups.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppExceptions {
  static void handleError(Object exception) {
    if (exception is DioError) {
      // if (exception.response?.data is bool) {
      //   log("is bool");
      //   return;
      // }
      if (exception.response?.data['message'] != null) {
        AppPopUps.showToast(
          exception.response!.data["message"],
          Colors.red,
        );
      } else if (exception.error is SocketException) {
        AppPopUps.showToast("Please check your connection", Colors.red);
        return;
      } else if (exception.error is PlatformException) {
        AppPopUps.showToast("Platform Exception", Colors.red);
      } else if (exception.type == DioErrorType.cancel) {
        AppPopUps.showToast("Request cancelled", Colors.red);
      } else if (exception.type == DioErrorType.connectTimeout) {
        AppPopUps.showToast("Connection time out", Colors.red);
      } else if (exception.type == DioErrorType.receiveTimeout) {
        AppPopUps.showToast("Recieve time out", Colors.red);
      } else if (exception.type == DioErrorType.sendTimeout) {
        AppPopUps.showToast("Send time out", Colors.red);
      } else if (exception.type == DioErrorType.other) {
        AppPopUps.showToast("Error occured", Colors.red);
      } else if (exception.type == DioErrorType.response) {
        AppPopUps.showToast("Error occured", Colors.red);
      }
    } else if (exception is PlatformException) {
      log(exception.message.toString());
    } else if (exception is TimeoutException) {
      log(exception.message.toString());
    } else if (exception is CloudinaryException) {
      log(exception.message.toString());
    } else {
      log('I am here');
      AppPopUps.showToast(exception.toString(), Colors.red);
      log(exception.toString());
    }
  }
}
