import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_music/pages/home/home_page.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/pages/splash_page.dart';
import 'package:flutter_music/pages/normal_page.dart';
import 'package:flutter_music/pages/routing_reference.dart';

/* *
 * handler就是每个路由的规则，编写handler就是配置路由规则，
 * 比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。
 */

// 启动页面
Handler splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return SplashPage();
});


// 登陆页面
Handler loginHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return LoginPage();
  }
);


// 跳转到主页
Handler homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return HomePage();
});



// 正常路由跳转
Handler normalPageHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return NormalPage();
  }
);

// 路由传参
Handler routingReferenceHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    String id = params['id'].first;
    return RoutingReference(id: id);
  }
);

