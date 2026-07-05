import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio? dio;

  DioHelper() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  getRequest({required endPoint,  Map<String, dynamic>? query }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  postRequest({required endPoint, required Map<String, dynamic> data}) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
