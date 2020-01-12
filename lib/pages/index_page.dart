import 'package:flutter/material.dart';
import 'package:flutter_music/utils/navigator_util.dart';
import 'package:flutter_music/widgets/v_empty_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Scaffold(
          appBar: AppBar(
            title: Text('fluro'),
          ),
          body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          color: Colors.grey,
                        )),
                  ),
                  VEmptyView(120),
                  MaterialButton(
                    child: Text(
                      '正常路由跳转',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    minWidth: 300.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                    onPressed: () => NavigatorUtil.jump(context, '/normalPage'),
                  ),
                  SizedBox(height: 10.0),
                  MaterialButton(
                    child: Text(
                      '路由穿参：200',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    minWidth: 300.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                    onPressed: () =>
                        NavigatorUtil.jump(context, '/routingReference?id=200'),
                  ),
                  SizedBox(height: 10.0),
                  MaterialButton(
                    child: Text(
                      '跳转登陆页并删除当前路由',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    minWidth: 300.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                    onPressed: () => NavigatorUtil.goToLoginRemovePage(context),
                  ),
                  SizedBox(height: 10.0),
                  MaterialButton(
                    child: Text(
                      'flutterToast',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    minWidth: 300.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
