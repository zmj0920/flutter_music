import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/cart_page.dart';
import 'package:flutter_music/pages/category_page.dart';
import 'package:flutter_music/pages/home_page.dart';
import 'package:flutter_music/pages/member_page.dart';


var homehHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return HomePage();
    });


var categoryHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return CategoryPage();
    });


var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return CartPage();
    });


var dailySongsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return MemberPage();
    });

// 跳转到歌单
// var playListHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//       String title = params['title'].first;
//       String id = params['id'].first;
//       return PlayListPage(FluroConvertUtils.fluroCnParamsDecode(title), FluroConvertUtils.string2int(id));
//     });
