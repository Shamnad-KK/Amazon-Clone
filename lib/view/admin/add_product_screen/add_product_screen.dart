import 'dart:developer';
import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_text_field.dart';
import 'package:amazon_clone/controller/admin/add_product_controller.dart';
import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:amazon_clone/helpers/app_padding.dart';
import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:amazon_clone/helpers/app_textstyle.dart';
import 'package:amazon_clone/model/user_model.dart';
import 'package:amazon_clone/view/user/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/app_colors.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController addProductController = Get.find();
    UserModel user = Get.find<AuthController>().user;
    final formKey = GlobalKey<FormState>();
    log('build');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: AppTextStyle.body1,
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: AppPadding.mainPading,
            child: Column(
              children: [
                Obx(
                  () => addProductController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : addProductController.images.isNotEmpty
                          ? CarouselSlider(
                              items: addProductController.images.map((e) {
                                return Image.file(
                                  File(e.path),
                                  fit: BoxFit.cover,
                                  height: 200,
                                );
                              }).toList(),
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: 200,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                addProductController.pickMultipleImages();
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.folder_open),
                                      AppSpacing.kHeight10,
                                      Text(
                                        'Select Product Images',
                                        style: AppTextStyle.body2.copyWith(
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                ),
                AppSpacing.kHeight30,
                CustomTextField(
                  controller: addProductController.productNameController,
                  hint: 'Product Name',
                  validator: (p0) =>
                      addProductController.productNameValidation(p0),
                ),
                AppSpacing.kHeight10,
                CustomTextField(
                  controller: addProductController.descriptionController,
                  hint: 'Description',
                  maxLines: 7,
                  validator: (p0) =>
                      addProductController.descriptionValidation(p0),
                ),
                AppSpacing.kHeight10,
                CustomTextField(
                  controller: addProductController.priceController,
                  hint: 'Price',
                  validator: (p0) => addProductController.priceValidation(p0),
                ),
                AppSpacing.kHeight10,
                CustomTextField(
                  controller: addProductController.quantityController,
                  hint: 'Quantity',
                  validator: (p0) =>
                      addProductController.quantityValidation(p0),
                ),
                AppSpacing.kHeight10,
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        value: addProductController.category.value,
                        items: addProductController.categoryList
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          addProductController.changeCategory(value!);
                          log(value.toString());
                        },
                        validator: (p0) =>
                            addProductController.categoryValidation(p0),
                      ),
                    ),
                  ),
                ),
                AppSpacing.kHeight10,
                CustomButtonWidget(
                  text: 'Sell',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      addProductController.addProduct(user.token!);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
