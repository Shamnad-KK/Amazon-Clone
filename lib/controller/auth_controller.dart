import 'dart:developer';

import 'package:amazon_clone/model/auth_model.dart';
import 'package:amazon_clone/services/auth_services.dart';
import 'package:amazon_clone/view/auth/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
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
    );
    log(signUpModel.toJson().toString());
    AuthServices().signUp(signUpModel).then((value) {
      if (value != null) {
        log("signed up");
      }
    });
    isLoading.value = false;
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
