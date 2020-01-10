import 'package:flutter/material.dart';
import 'package:flutter_music/utils/navigator_util.dart';

class NormalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('normalpage'),
      ),
      body: Center(child: Container(
        child: RaisedButton(
          child: Text("返回"),
          onPressed: (){
            NavigatorUtil.goBack(context);
          },
        ),
      ),),
    );
  }
}