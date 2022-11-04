import 'package:amazon_clone/config/app_exceptions.dart';
import 'package:amazon_clone/constants/api_endpoints.dart';
import 'package:amazon_clone/constants/app_urls.dart';
import 'package:amazon_clone/model/auth_model.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<SignUpModel?> signUp(SignUpModel signUpModel) async {
    try {
      Dio dio = Dio();

      const url = AppUrls.baseUrl + ApiEndpoints.signUp;
      Response response = await dio.post(
        url,
        data: signUpModel.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return SignUpModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
