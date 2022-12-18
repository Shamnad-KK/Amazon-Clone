import 'package:amazon_clone/helpers/app_padding.dart';
import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const imageUrl =
        'https://images.unsplash.com/photo-1668241282073-2cf47bae10d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: AppPadding.mainPading,
          child: Text('Deal of the day'),
        ),
        Center(
          child: Image.network(
            imageUrl,
            height: size.height * 0.26,
            width: size.width * 0.8,
            fit: BoxFit.cover,
          ),
        ),
        AppSpacing.kHeight5,
        const Padding(
          padding: AppPadding.horizontalPadding8,
          child: Text(
            '\$800',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
        ),
        AppSpacing.kHeight5,
        const Padding(
          padding: AppPadding.horizontalPadding8,
          child: Text(
            'Shamnad',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AppSpacing.kHeight5,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                imageUrl,
                height: size.height * 0.12,
                width: size.width * 0.3,
                fit: BoxFit.cover,
              ),
              Image.network(
                imageUrl,
                height: size.height * 0.12,
                width: size.width * 0.3,
                fit: BoxFit.cover,
              ),
              Image.network(
                imageUrl,
                height: size.height * 0.12,
                width: size.width * 0.3,
                fit: BoxFit.cover,
              ),
              Image.network(
                imageUrl,
                height: size.height * 0.12,
                width: size.width * 0.3,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Padding(
          padding: AppPadding.verticalPading15.copyWith(left: 8),
          child: const Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan),
          ),
        ),
      ],
    );
  }
}
