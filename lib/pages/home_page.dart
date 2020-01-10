import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/utils/navigator_util.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();

  List list = new List();

  String showText = '欢迎你来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        appBar: AppBar(
          title: Text("美好人间"),
        ),
        //解决溢出问题
        body: SingleChildScrollView(
            child: Container(
          child: RaisedButton(
            onPressed: () {
              NavigatorUtil.goHomePage(context);
            },
            child: Text("远程数据"),
          ),
        )));
  }
}
