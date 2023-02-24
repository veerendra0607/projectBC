
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:part_details/model/part_details_model.dart';
import 'package:riverpod/riverpod.dart';

abstract class ApiFunction {
  Future<PartDetails?> getData();
}

final partDetailsRepositoryProvider =
Provider((ref) => MyApiRepo());

class MyApiRepo implements ApiFunction{

  final Dio _dio = Dio();

  @override
  Future<PartDetails?> getData() async {
    var baseUrl = 'http://crm.bemlindia.in/beml/modules/Mobile/v1/fetchRecordWithGrouping';
    var formData = FormData.fromMap({
      'module': 'FailedParts',
      'access_token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIzMjgifQ.SXPWzlEmHo39siKEzn9f34m2Cgz4jM4dxg68AWEEguU',
      'useruniqueid': '328',
      'record': '57x621426'
    });
    PartDetails? data;
    try {
      Response userData = await _dio.post(baseUrl, data: formData);
      print('User Info: ${userData.data}');
      data = PartDetails.fromJson(userData.data);
    } on DioError catch (e) {
      print(e);
    }
    return data;
  }




  @override
  Future<LineItemEdit?> PostData(LineItemEdit lineDataList) async {
    var baseUrl = 'http://crm.bemlindia.in/bemlquality/modules/Mobile/v1/saveRecord';
    var formData = FormData.fromMap({
      'module': 'FailedParts',
      'access_token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIzMjgifQ.SXPWzlEmHo39siKEzn9f34m2Cgz4jM4dxg68AWEEguU',
      'useruniqueid': '328',
      'record': '57x621426',
      'values': lineDataList.toJson().toString(),
    });


    LineItemEdit? data;
    try {

      Response editData = await _dio.post(baseUrl,data:formData.toString());

      // data = LineItem.fromJson(editData.data);
      print("=========>");
      print(editData);
      print('edit1 data: ${formData.toString()}');
    } on DioError catch (e) {
      print(e);
    }
    return data;
  }

}