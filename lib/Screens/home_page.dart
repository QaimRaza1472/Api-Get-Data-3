import 'package:api_get_data_3/Models/models.dart';
import 'package:api_get_data_3/Services/remote_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<AlbumModel>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    posts= await RemoteServices().getPost();
    if(posts !=null){
      setState(() {
        isLoaded = true;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Learning"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
            itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0,0),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ]
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Text(posts![index].id.toString()),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(posts![index].title,
                            maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            ),

                            Text(posts![index].body ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
