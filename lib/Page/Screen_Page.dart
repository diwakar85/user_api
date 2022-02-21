import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    var data=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.id.toString()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: CircleAvatar(backgroundImage: NetworkImage("${data.avatar}"),
                maxRadius: 100,
                )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data.frist_name),
              Text(data.last_mame),
            ],
          ),
          Text(data.email),
        ],
      ),
    );
  }
}
