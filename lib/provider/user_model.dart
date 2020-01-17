import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/model/user.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:flutter_music/utils/utils.dart';

class UserModel with ChangeNotifier {
  User _user;

  User get user => _user;

  /// 初始化 User
  void initUser() {
    if (Application.sp.containsKey('user')) {
      String s = Application.sp.getString('user');
      _user = User.fromJson(json.decode(s));
    }
  }

  /// 登录
  Future<User> login(BuildContext context, String phone, String pwd) async {
    User user = await NetUtils.login(context, phone, pwd);
    if (user.code > 299) {
      Utils.showToast(user.msg ?? '登录失败，请检查账号密码');
      return null;
    }
    Utils.showToast(user.msg ?? '登录成功');
    _saveUserInfo(user);
    return user;
  }

  // Future<UserDetail> getUserDetail(BuildContext context, int uid) async {
  //   UserDetail userDetail = await NetUtils.getUserDetail(context, uid);
  //   if (userDetail.code == 200) {
  //     Application.sp.setString('userDetail', json.encode(userDetail.toJson()));
  //       UserDetail us = UserDetail.fromJson(json.decode(Application.sp.getString('userDetail')));
  //       print("6666");
  //      print(us.userPoint.userId);
  //   }
  //   return userDetail;
  // }

  /// 保存用户信息到 sp
  _saveUserInfo(User user) async {
    _user = user;
    Application.sp.setString('user', json.encode(user.toJson()));
    // User us = User.fromJson(json.decode(Application.sp.getString('user')));
    // print(us.profile.userId);
    // us.bindings.forEach((item) {
    //   print(item.id);
    // });
  }
}
