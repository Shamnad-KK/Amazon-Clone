import 'package:amazon_clone/common/utils/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImgaes extends StatelessWidget {
  const CarouselImgaes({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((e) {
        return Image.network(
          loadingBuilder: (context, child, loadingProgress) {
            return child;
          },
          e,
          fit: BoxFit.cover,
          height: size.height * 0.3,
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: size.height * 0.25,
      ),
    );
  }
}
