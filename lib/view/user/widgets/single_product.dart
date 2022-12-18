import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_padding.dart';
import 'package:flutter/material.dart';

class SingleProductWidget extends StatelessWidget {
  const SingleProductWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: AppPadding.horizontalPadding5,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteColor,
        ),
        child: Container(
          width: size.width * 0.4,
          padding: AppPadding.allside10,
          child: Image.network(
            image,
            height: size.height * 0.04,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
