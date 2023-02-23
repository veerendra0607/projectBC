import 'package:part_details/model/part_details_model.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<PartDetails?> getPartDetails() async{
    var client =http.Client();
    var uri=Uri.parse('http://crm.bemlindia.in/beml/modules/Mobile/v1/fetchRecordWithGrouping');
    var response= await client.post(uri);
    if(response.statusCode==200){
      var json1=response.body;
      return PartDetails.fromJson(json1.toString() as Map<String, dynamic>);
    }
  }
}