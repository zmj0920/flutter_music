import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/pages/login_page.dart';
import 'package:flutter_music/provider/user_model.dart';
import 'package:flutter_music/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _logoController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    _scaleTween = Tween(begin: 0, end: 1);
    _logoController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500), () {
      //播放动画
      _logoController.forward();
    });
    _logoAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);

    //动画事件监听器，它可以监听到动画的执行状态，只监听动画是否结束，如果结束则执行页面跳转动作
    _logoAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          goPage();
        });
      }
    });
  }

  void goPage() async {
    await Application.initSp();
    //listen为 false在 build 方法中使用上面的代码，当被调用的时候不会使 widget 被重构
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    userModel.initUser();
      if (userModel.user != null) {
        await NetUtils.refreshLogin(context).then((value){
          if(value.data != -1){
            NavigatorUtil.goHomePage(context);
          }
        });
      } else
       {
          NavigatorUtil.goLoginPage(context);
       }
  }

  @override
  Widget build(BuildContext context) {
    // dio 初始化
    NetUtils.init();
    // 屏幕适配
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ScaleTransition(
          scale: _logoAnimation,
          child: Hero(
            tag: 'logo',
            child: Image.asset('images/icon_logo.png'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }
}
