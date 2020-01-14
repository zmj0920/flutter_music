import 'package:flutter/material.dart';


//把导航相关的功能封装成 Service

//通过 key.currentState 获取到 NavigatorState 实例。暴露了导航的 push 和 pushName 功能

class NavigateService {
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  NavigatorState get navigator => key.currentState;

  get pushNamed => navigator.pushNamed;
  get push => navigator.push;
  get popAndPushNamed => navigator.popAndPushNamed;
}
