import 'package:flutter/material.dart';
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.red,
            body: Container(
              child: Text("我的"),
            ),
    );
  }
}