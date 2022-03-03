import 'package:api_get_data_3/Models/models.dart';
import 'package:http/http.dart' as http;



 class RemoteServices {
  Future<List<AlbumModel>?> getPost()async{
   var client = http.Client();
   var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
   var response= await client.get(uri);
   if(response.statusCode==200){
   var json = response.body;
   return albumModelFromJson(json);
   }
  }
 }