import 'dart:developer';

import 'package:amazon_clone/common/utils/app_popups.dart';
import 'package:amazon_clone/common/utils/pick_images.dart';
import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/model/admin_product_model.dart';
import 'package:amazon_clone/routes/route_names.dart';
import 'package:amazon_clone/services/admin/add_product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  RxString category = 'Mobiles'.obs;

  List<String> categoryList = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void changeCategory(String value) {
    category.value = value;
  }

  List<XFile> images = [];

  RxBool isLoading = false.obs;

  void pickMultipleImages() async {
    isLoading.value = true;
    images = await PickImage.pickMultipleImages();
    log(images.toString());
    isLoading.value = false;
  }

  void addProduct(String token) async {
    if (images.isEmpty) {
      AppPopUps.showToast("Image shouldn't be empty", Colors.red);
      return;
    }

    await AddProductServices()
        .addProduct(
      token: token,
      name: productNameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      quantity: int.tryParse(quantityController.text),
      category: category.value,
      images: images,
    )
        .then((value) async {
      if (value != null) {
        await Get.offAllNamed(RouteNames.adminBottomNavBar);
        AppPopUps.showToast(value, AppColors.successColor);
      }
    });
  }

  String? productNameValidation(String? value) {
    if (value!.isEmpty) {
      return "Product cannot be empty";
    }
    return null;
  }

  String? descriptionValidation(String? value) {
    if (value!.isEmpty) {
      return "Description cannot be empty";
    }
    return null;
  }

  String? priceValidation(String? value) {
    if (value!.isEmpty) {
      return "Price cannot be empty";
    }
    return null;
  }

  String? quantityValidation(String? value) {
    if (value!.isEmpty) {
      return "Quantity cannot be empty";
    }
    return null;
  }

  String? categoryValidation(String? value) {
    if (value!.isEmpty) {
      return "Category cannot be empty";
    }
    return null;
  }
}
