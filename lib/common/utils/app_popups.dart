import 'package:amazon_clone/helpers/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppPopUps {
  static Future<void> showToast(
    String msg,
    Color color, [
    Toast toastLength = Toast.LENGTH_SHORT,
  ]) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color,
      toastLength: toastLength,
    );
  }

  static void logoutPopUp(BuildContext context, VoidCallback onTap) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Are you sure?",
            style: AppTextStyle.headline6,
          ),
          content: const Text(
            "Do you want to Log Out ?",
            style: AppTextStyle.body1,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: AppTextStyle.body2,
              ),
            ),
            TextButton(
              onPressed: () {
                onTap();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Yes",
                style: AppTextStyle.body2,
              ),
            ),
          ],
        );
      },
    );
  }
}
