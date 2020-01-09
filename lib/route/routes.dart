//fluro 的路由管理
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/route/route_handles.dart';

class Routes {
  static String root = "/";
  static String login = "/login";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return LoginPage();
    });

    router.define(root,handler:loginHandler);
    router.define(login,handler:splashHandler);
  }
}
