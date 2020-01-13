import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Scaffold(
          appBar: AppBar(
            title: Text('首页'),
          ),
          body: Container(
            child: Center(
              child:Text("首页")
            ),
          ),
        ));
  }
}
