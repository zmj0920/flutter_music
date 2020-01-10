import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/index_page.dart';
import 'package:flutter_music/route/route_handles.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String dailySongs = "/daily_songs";
  static String playList = "/play_list";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return IndexPage();
    });
    router.define(root, handler: categoryHandler);
    router.define(home, handler: homeHandler);
  }
}
