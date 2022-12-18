import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone/config/app_exceptions.dart';
import 'package:amazon_clone/constants/api_endpoints.dart';
import 'package:amazon_clone/constants/app_urls.dart';
import 'package:amazon_clone/constants/cloudinary_constants.dart';
import 'package:amazon_clone/model/admin_product_model.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AddProductServices {
  Future<AdminProductModel?> getDownloadUrlWithModel(
    String? name,
    String? description,
    double price,
    int? quantity,
    String? category,
    List<XFile> images,
  ) async {
    try {
      final cloudinary = CloudinaryPublic(
          CloudinaryConstants.cloudName, CloudinaryConstants.uploadPreset);
      List<String> imageUrls = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(response.secureUrl);
      }
      AdminProductModel productModel = AdminProductModel(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        images: imageUrls,
      );
      return productModel;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<String?> addProduct({
    required String token,
    required String? name,
    required String? description,
    required double price,
    required int? quantity,
    required String? category,
    required List<XFile> images,
  }) async {
    Dio dio = Dio();
    try {
      await getDownloadUrlWithModel(
              name, description, price, quantity, category, images)
          .then((product) async {
        if (product != null) {
          const url = AppUrls.baseUrl + ApiEndpoints.addProduct;
          Response response = await dio.post(
            url,
            options: Options(
              headers: {
                'content-type': 'application/json',
                'cccept': 'application/json',
                "x-auth-token": token
              },
            ),
            data: product.toJson(),
          );
          if (response.statusCode! >= 200 && response.statusCode! <= 299) {
            log(response.data.toString());
            return response.data["message"];
          }
        }
        return null;
      });
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
