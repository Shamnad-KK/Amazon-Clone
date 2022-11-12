import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:amazon_clone/view/home/widgets/address_box.dart';
import 'package:amazon_clone/view/home/widgets/carousel_images.dart';
import 'package:amazon_clone/view/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/view/home/widgets/top_categories.dart';
import 'package:amazon_clone/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../helpers/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient,
            ),
          ),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: size.width * 0.3,
                    height: size.height * 0.045,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: CustomTextField(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: AppColors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        contentPadding: const EdgeInsets.only(top: 10),
                        hint: 'Search Amazon.in',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AddressBox(),
          AppSpacing.kHeight10,
          TopCategories(),
          AppSpacing.kHeight10,
          CarouselImgaes(),
          AppSpacing.kHeight10,
          DealOfTheDay(),
        ],
      ),
    );
  }
}
