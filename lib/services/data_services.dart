import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_flutter_app/model/data_model.dart';

class DataService{
  String baseUrl="http://mark.bslmeiyu.com/api";
  getInfo() async{
    var apiUrl="/getplaces";
    http.Response res= await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> data=json.decode(res.body);
        print(data);
        return data.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}