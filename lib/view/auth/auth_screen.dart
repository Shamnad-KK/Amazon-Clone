import 'dart:developer';

import 'package:amazon_clone/view/widgets/custom_button.dart';
import 'package:amazon_clone/view/widgets/custom_text_field.dart';
import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_padding.dart';
import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:amazon_clone/helpers/app_textstyle.dart';
import 'package:amazon_clone/view/auth/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final signUpFormKey = GlobalKey<FormState>();
    final signInFormKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: AppTextStyle.titleLarge,
              ),
              AppSpacing.kHeight20,
              Obx(() {
                return ListTile(
                  tileColor: authController.auth.value == AuthEnum.SIGN_UP
                      ? AppColors.backgroundColor
                      : AppColors.greyBackgroundCOlor,
                  leading: Radio(
                    value: AuthEnum.SIGN_UP,
                    groupValue: authController.auth.value,
                    activeColor: AppColors.secondaryColor,
                    onChanged: (value) {
                      authController.changeRadio(value!);
                    },
                  ),
                  title: Text(
                    "Create Account",
                    style: AppTextStyle.body2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                );
              }),
              Obx(() {
                if (authController.auth.value == AuthEnum.SIGN_UP) {
                  log(authController.auth.value.toString());
                  return Container(
                    padding: AppPadding.mainPading,
                    color: AppColors.backgroundColor,
                    child: Form(
                      key: signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: authController.nameController,
                            hint: "Name",
                            validator: (p0) =>
                                authController.usernameValidation(p0),
                          ),
                          AppSpacing.kHeight10,
                          CustomTextField(
                            controller: authController.emailController,
                            hint: "Email",
                            validator: (p0) =>
                                authController.emailValidation(p0),
                          ),
                          AppSpacing.kHeight10,
                          CustomTextField(
                            controller: authController.passwordController,
                            hint: "Password",
                            validator: (p0) =>
                                authController.passwordValidation(p0),
                          ),
                          AppSpacing.kHeight10,
                          authController.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomButtonWidget(
                                  text: "Sign Up",
                                  onTap: () {
                                    if (signUpFormKey.currentState!
                                        .validate()) {
                                      authController.signUp();
                                    }
                                  },
                                ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
              Obx(() {
                return ListTile(
                  tileColor: authController.auth.value == AuthEnum.SIGN_IN
                      ? AppColors.backgroundColor
                      : AppColors.greyBackgroundCOlor,
                  leading: Radio(
                    value: AuthEnum.SIGN_IN,
                    groupValue: authController.auth.value,
                    activeColor: AppColors.secondaryColor,
                    onChanged: (value) {
                      authController.changeRadio(value!);
                    },
                  ),
                  title: Text(
                    "Sign-In.",
                    style: AppTextStyle.body2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                );
              }),
              Obx(
                () {
                  if (authController.auth.value == AuthEnum.SIGN_IN) {
                    return Container(
                      padding: AppPadding.mainPading,
                      color: AppColors.backgroundColor,
                      child: Form(
                        key: signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: authController.emailController,
                              hint: "Email",
                            ),
                            AppSpacing.kHeight10,
                            CustomTextField(
                              controller: authController.passwordController,
                              hint: "Password",
                            ),
                            AppSpacing.kHeight10,
                            authController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomButtonWidget(
                                    text: "Sign In",
                                    onTap: () {
                                      authController.signIn();
                                    },
                                  )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
