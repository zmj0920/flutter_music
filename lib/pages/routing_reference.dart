import 'package:flutter/material.dart';

class RoutingReference extends StatelessWidget {
  final String id;
  RoutingReference({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由传参数$id'),
      ),
      body: Text('传来'),
    );
  }
}