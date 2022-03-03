import 'package:api_get_data_3/Models/models.dart';
import 'package:api_get_data_3/Testing/testing_api_manager.dart';
import 'package:flutter/material.dart';

class TestingHomePage extends StatefulWidget {
  const TestingHomePage({ Key? key}) : super(key: key);

  @override
  _TestingHomePageState createState() => _TestingHomePageState();
}

class _TestingHomePageState extends State<TestingHomePage> {
    List<AlbumModel> ? post;

  @override
  void initState() {
    getData();
    super.initState();
  }
  bool isLoaded=false;
  void getData() async {
    post = await Testing_Api_Manager().TestData();
    if(post != null){
      setState(() {
        isLoaded=true;
      });
    }
  }
  int? selected;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: post?.length,
            itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selected=index;
                    });




                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: selected==index?Colors.amberAccent : Colors.white,
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
                            color: selected==index ? Colors.grey[300]:Colors.green,
                          ),
                          child: Center(
                            child: Text(post![index].id.toString(),
                            style: TextStyle(
                              color: selected==index?Colors.black : Colors.white


                            ),),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post![index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(post![index].body ?? '',
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
