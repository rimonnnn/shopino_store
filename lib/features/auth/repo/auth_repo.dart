import 'dart:developer';

import 'package:dartz/dartz.dart' as either;
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_end_points.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/model/login_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(this._dioHelper);
  Future<either.Either<String, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        data: {"email": email, "password": password},
        endPoint: ApiEndPoints.login,
      );

      final loginResponse = LoginResponseModel.fromJson(response.data);

      return either.Right(loginResponse);
    } on DioException catch (e) {
      log("DIO ERROR: ${e.response?.statusCode}");
      log("DIO RESPONSE: ${e.response?.data}");

      if (e.response?.statusCode == 401) {
        return const either.Left("Invalid email or password");
      }

      final responseData = e.response?.data;

      if (responseData is Map && responseData["message"] != null) {
        return either.Left(responseData["message"].toString());
      }

      return const either.Left("Login failed");
    } catch (e) {
      log("UNKNOWN ERROR: $e");
      return const either.Left("Something went wrong");
    }
  }
}
