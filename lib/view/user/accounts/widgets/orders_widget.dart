import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_padding.dart';
import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:amazon_clone/view/user/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: AppPadding.sidePading15,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppColors.selectedNavBarColor,
                ),
              ),
            ],
          ),
          AppSpacing.kHeight10,
          //Orders
          SizedBox(
            height: size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const SingleProductWidget(
                  image:
                      'https://www.freecodecamp.org/news/content/images/2022/04/derick-mckinney-oARTWhz1ACc-unsplash.jpg',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
