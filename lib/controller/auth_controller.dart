import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone/common/utils/app_popups.dart';
import 'package:amazon_clone/model/auth_model.dart';
import 'package:amazon_clone/routes/route_names.dart';
import 'package:amazon_clone/services/auth_services.dart';
import 'package:amazon_clone/view/auth/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthServices authServices = AuthServices();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<AuthEnum> auth = AuthEnum.SIGN_UP.obs;
  RxBool isSignUp = true.obs;
  RxBool isLoading = false.obs;

  void changeRadio(AuthEnum newEnum) {
    auth.value = newEnum;

    update();
    isSignUp != isSignUp;
  }

  void signUp() async {
    isLoading.value = true;
    final signUpModel = SignUpModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      type: "user",
      id: '',
      address: '',
      token: '',
    );
    log(signUpModel.toJson().toString());
    authServices.signUp(signUpModel).then((value) {
      isLoading.value = false;
      if (value != null) {
        log("signed up");
      }
    });
    isLoading.value = false;
  }

  void signIn() async {
    isLoading.value = true;
    await authServices
        .signIn(
      emailController.text,
      passwordController.text,
    )
        .then(
      (value) {
        if (value != null) {
          isLoading.value = false;
          AppPopUps.showToast(value, Colors.green);
        }
      },
    );
    isLoading.value = false;
  }

  void getUserData() async {
    await Future.delayed(const Duration(seconds: 2));
    authServices.getUserData().then(
      (value) {
        if (value != null) {
          Get.offAllNamed(RouteNames.homeScreen);
        }
      },
    );
  }

  String? usernameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter username";
    } else if (value.startsWith(RegExp('0-9'))) {
      return "Username cannot start with number";
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email";
    } else if (!value.contains("@") ||
        !value.contains(".") ||
        value.startsWith("@")) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password should have atleast 6 characters";
    } else {
      return null;
    }
  }
}
