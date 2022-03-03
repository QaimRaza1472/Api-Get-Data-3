

import 'dart:convert';

import 'package:api_get_data_3/Models/models.dart';
import 'package:api_get_data_3/Testing/strings.dart';
import 'package:http/http.dart' as http;

class Testing_Api_Manager{

  Future <List<AlbumModel>> TestData() async {
    var client= http.Client();
   var responseString;
    try{

      var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      print("---------------------------------");
      print(response.body);
      print("---------------------------------");
       var responseString= response.body;
       return albumModelFromJson(responseString);
    }
    catch  (Exception) {
      return albumModelFromJson(responseString);
    }
}

}