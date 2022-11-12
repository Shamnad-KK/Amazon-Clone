// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/helpers/app_textstyle.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_padding.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: AppPadding.accountsButtonPadding,
        height: size.height * 0.06,
        width: size.width * 0.3,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.whiteColor,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(50),
            color: AppColors.whiteColor),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: Colors.black12.withOpacity(0.03),
          ),
          onPressed: () {
            onTap();
          },
          child: Text(
            title,
            style: AppTextStyle.body2,
          ),
        ),
      ),
    );
  }
}
