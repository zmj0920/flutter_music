import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/route/routes.dart';


class NavigatorUtil {

  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }


  /// 登录页
  static void goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.login, clearStack: true);
  }

  /// 首页
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.home, clearStack: true);
  }













  // 返回
  static void goBack(BuildContext context) {
    /// 其实这边调用的是 Navigator.pop(context);
    Application.router.pop(context);
  }

  // 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 路由返回指定页面
  static void goBackUrl(BuildContext context, String title) {
    Navigator.popAndPushNamed(context, title);
  }

  // 跳转到主页面
  static void goIndexPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home, replace: true);
  }

  /// 跳转到 转场动画 页面 ， 这边只展示 inFromLeft ，剩下的自己去尝试下，
  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
  static Future jump(BuildContext context, String title) {
    return Application.router.navigateTo(context, title, transition: TransitionType.inFromRight);

    /// 指定了 转场动画
  }

  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
  static Future jumpLeft(BuildContext context, String title) {
    return Application.router
        .navigateTo(context, title, transition: TransitionType.inFromLeft);
    /// 指定了 转场动画
  }

  // static Future jumpRemove(BuildContext context) {
  //   return Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(
  //         builder: (context) => IndexPage(),
  //       ),
  //       (route) => route == null);
  // }

  /// 自定义 转场动画
  static Future gotransitionCustomDemoPage(BuildContext context, String title) {
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
        scale: animation,
        child: new RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };
    return Application.router.navigateTo(context, title,
        transition: TransitionType.custom,
        /// 指定是自定义动画
        transitionBuilder: transition,
        /// 自定义的动画
        transitionDuration: const Duration(milliseconds: 600));
    /// 时间
  }

  /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
  /// Fluro本身不带，但是 Flutter自带
  static Future gotransitionCupertinoDemoPage(
      BuildContext context, String title) {
    return Application.router
        .navigateTo(context, title, transition: TransitionType.cupertino);
  }

  // 跳转到主页面IndexPage并删除当前路由
  // static void goToHomeRemovePage(BuildContext context) {
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(
  //         builder: (context) => IndexPage(),
  //       ),
  //       (route) => route == null);
  // }

  // 跳转到登录页并删除当前路由
  static void goToLoginRemovePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => route == null);
  }
}
