import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/route/navigate_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static Router router;
  static GlobalKey<NavigatorState> key = GlobalKey();
  static SharedPreferences sp;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;
  static double bottomBarHeight;
  static GetIt getIt = GetIt.instance;

  static initSp() async{
    sp = await SharedPreferences.getInstance();
  }

//https://juejin.im/post/5d1daadbe51d457759648755
//在容器中注册了一个单例模式使用的 NavigateService。之后我们所有需要注册的 Service 都在这里注册一遍即可。
// GetIt 提供了多种注册方式，这将会影响这些对象的生命周期。目前有三种：
// 工厂模式：void registerFactory<T>(FactoryFunc<T> func) 每次都会返回新的实例。
// 单例模式：void registerSingleton<T>(T instance) 每次返回同一实例。 这种模式需要手动初始化。
// 单例模式（懒加载）： void registerLazySingleton<T>(FactoryFunc<T> func) 这种方式只有第一次注入依赖的时候，才会初始化服务，并且每次返回相同实例。

  static setupLocator(){
    getIt.registerSingleton(NavigateService());
  }
}
