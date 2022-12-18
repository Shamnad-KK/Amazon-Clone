import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserGreetingWidget extends StatelessWidget {
  const UserGreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = Get.find<AuthController>().user;
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        gradient: AppColors.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: RichText(
        text: TextSpan(
          text: 'Hello, ',
          style: const TextStyle(fontSize: 22, color: AppColors.black),
          children: [
            TextSpan(
              text: user.name,
              style: const TextStyle(
                fontSize: 22,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
