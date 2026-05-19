import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_end_points.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/model/login_response_model.dart';

class AuthRepo {
  Future<Either<String, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    final response = await DioHelper.postRequest(
      endPoint: ApiEndPoints.login,
      data: {"email": email, "password": password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data,
      );
      return right(loginResponseModel);
    } else {
      return left(response.toString());
    }
  }
}
