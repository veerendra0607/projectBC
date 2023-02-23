// import '../model/part_details_model.dart';
// import 'package:dio/dio.dart';
//
// abstract class PartDetailsRepository{
//   Future<PartDetails?> getPartDetails();
// }
//
// class PartDetail extends PartDetailsRepository{
//   @override
//   Future<PartDetails?> getPartDetails() async{
//     // TODO: implement getPartDetails
//     final dio=Dio();
//     Response<Map<String, dynamic>> response =  await dio.post("http://crm.bemlindia.in/beml/modules/Mobile/v1/fetchRecordWithGrouping",
//         data: FormData.fromMap({
//         'name': 'wendux',
//         'age': 25,
//         })).then((value) async {
//            PartDetails? data= await PartDetails.fromJson( value.data!);
//                return data;
//     } );
//   }
//
// }

// import 'package:dio/dio.dart';
//
// import '../model/part_details_model.dart';
//
// Future<PartDetails> getPartDetail() async{
//   var url="http://crm.bemlindia.in/beml/modules/Mobile/v1/fetchRecordWithGrouping";
//   var formData=FormData.fromMap({
//     'module':'FailedParts',
//     'access_token':'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIzMjgifQ.SXPWzlEmHo39siKEzn9f34m2Cgz4jM4dxg68AWEEguU',
//     'useruniqueid':'328',
//     'record':'57x621426'
//   });
//   Dio dio = Dio();
//   PartDetails responce;
//   try{
//     responce=await dio.post(url,data: formData);
//     print("==========>");
//     print(responce);
//   }catch(e){
//     print(e);
//   }
//   return responce;
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/part_details_model.dart';
import 'package:riverpod/riverpod.dart';


abstract class PartDetialsRepository {
  Future<PartDetails> getPartDetails();
}
final partDetailsRepositoryProvider =
Provider((ref) => MyPartDetailRepository());

class MyPartDetailRepository implements PartDetialsRepository {

  MyPartDetailRepository();
  // final Reader _reader;
  final _dioClient = Dio();
  final url = 'http://crm.bemlindia.in/beml/modules/Mobile/v1/fetchRecordWithGrouping';
  var formData=FormData.fromMap({
    'module':'FailedParts',
    'access_token':'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIzMjgifQ.SXPWzlEmHo39siKEzn9f34m2Cgz4jM4dxg68AWEEguU',
    'useruniqueid':'328',
    'record':'57x621426'
  });
  @override
  Future<PartDetails> getPartDetails() async {
    try {

      final result = await _dioClient.post(url,data:formData );
      print("========>");
      print(result.statusCode);
      if (result.statusCode == 200) {
        print("===============>");
        print(result);
        return PartDetails.fromJson(jsonDecode(result.data)as Map<String, dynamic>);
      } else {
        throw Exception();
      }
    } catch (e) {
      print("========>");
      print(e);
      throw Exception();
    }
  }
}