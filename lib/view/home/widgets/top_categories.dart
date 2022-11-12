import 'package:amazon_clone/common/utils/global_variables.dart';
import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:amazon_clone/helpers/app_textstyle.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    GlobalVariables.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: size.height * 0.07,
                    width: size.width * 0.15,
                  ),
                ),
              ),
              AppSpacing.kHeight10,
              Text(
                GlobalVariables.categoryImages[index]['title']!,
                style: AppTextStyle.subtitle2,
              )
            ],
          );
        },
      ),
    );
  }
}
