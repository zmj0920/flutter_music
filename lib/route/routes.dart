import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/route/route_handles.dart';

class Routes {
  static String root = '/'; //启动页
  static String indexPage = '/indexPage';
  static String normalPage = '/normalPage';
  static String routingReference = '/routingReference';
  static String login = '/login'; //登录页面
  static String home = "/home";  //首页


  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
        print('找不到路由，404');
         return LoginPage();
      },
    );

    // 路由页面配置

    router.define(root, handler: splashHandler); //启动页
    router.define(login, handler: loginHanderl); //登录
    router.define(home, handler: homeHandler); //首页





    router.define(indexPage, handler: indexPageHanderl);
    router.define(normalPage, handler: normalPageHanderl);
    router.define(routingReference, handler: routingReferenceHanderl);
  }
}
