import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart'as http;
import 'package:real_api/Page/Screen_Page.dart';

import 'Model_Class/data.dart';
void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 Future<List<Data>?> fatchData()async{
    String API="https://reqres.in/api/users?page=2";
    http.Response response=await http.get(Uri.parse(API));
    if(response.statusCode==200){
      var res=jsonDecode(response.body);
      List data=res['data'];
      return data.map((e) => Data.formjson(e)).toList();
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title:const Text("API SERVICE"),
        centerTitle: true,
      ),
      body:RefreshIndicator(
        onRefresh: (){
          return fatchData();
        },
        child: FutureBuilder(
            future: fatchData(),
            builder: (context,AsyncSnapshot  ss){
              if (ss.hasError) {
                return Center(child: Text("${ss.error}"),);
              }
              else if(ss.hasData){
                List<Data>? data=ss.data as List<Data>?;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context,i){
                      return Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 10,
                        color: Colors.white,
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundImage:NetworkImage("${data?[i].avatar}"),
                          ),
                          title: Text("${data?[i].frist_name} ${data?[i].last_mame}"),
                          subtitle: Text("${data?[i].email}"),
                          trailing: Text("${data?[i].id}"),
                          onTap: (){
                            Get.to(const ScreenPage(),arguments: data?[i]);
                          },
                        ),
                      );
                    }
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        ),
      )
    );
  }
}
