import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_music/pages/index_page.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/pages/normal_page.dart';
import 'package:flutter_music/pages/routing_reference.dart';

/* *
 * handler就是每个路由的规则，编写handler就是配置路由规则，
 * 比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。
 */

// 首页
Handler indexPageHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return IndexPage();
  },
);

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

// 登陆页面
Handler loginHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return LoginPage();
  }
);