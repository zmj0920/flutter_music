import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/model/user.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    print("123456");
    User user = await NetUtils.login(context, phone, pwd);
    if (user.code > 299) {
      return null;
    }
    await _saveUserInfo(user);
    return user;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('user', json.encode(user.toJson()));
    User us = User.fromJson(json.decode(sp.getString('user')));
    us.bindings.forEach((item) {
      print(item.id);
    });
  }
}
