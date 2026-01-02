import 'dart:convert';
import 'package:dio/dio.dart';

import '../base/base_response_model.dart';

class NetworkDecoding {
  NetworkDecoding._();

  static K decode<T extends BaseResponseModel, K>({
    required Response<dynamic> response,
    required T responseModel,
  }) {
    try {
      dynamic responseData = response.data;
      
      // Eğer response.data String ise, JSON olarak parse et
      if (responseData is String) {
        responseData = jsonDecode(responseData);
      }
      
      if (responseData is List) {
        final asList = responseData;
        final dataList =
            List<T>.from(
                  asList.map((item) => responseModel.fromJson(item as Map<String, dynamic>)),
                ).toList()
                as K;
        return dataList;
      } else {
        final data = responseModel.fromJson(responseData as Map<String, dynamic>) as K;
        return data;
      }
    } on TypeError {
      rethrow;
    } catch (e) {
      throw TypeError();
    }
  }
}
