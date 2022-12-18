import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.secondaryColor,
    this.textColor = AppColors.black,
  });
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: color,
          // borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.body2,
          ),
        ),
      ),
    );
    //  ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.zero,
    //     backgroundColor: inverted ? Colors.white : AppColors.customButtonColor,
    //     side: const BorderSide(color: Colors.black, width: 0.1),
    //     minimumSize: const Size(double.infinity, 50),
    //   ),
    //   onPressed: () {
    //     onTap();
    //   },
    //   child: Text(
    //     text,
    //     style: inverted
    //         ? AppTextStyle.customButtonBlackStyle
    //         : AppTextStyle.customButtonWhiteStyle,
    //   ),
    // );
  }
}
