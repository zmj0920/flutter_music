import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/pages/splash_page.dart';


var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String,List<Object>> params){
    return new LoginPage();
  }
);

var splashHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String,List<Object>> params){
    return new SplashPage();
  }
);