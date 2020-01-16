//网络请求管理
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/model/user.dart';
import 'package:flutter_music/model/swiper_banner.dart';
import 'package:flutter_music/model/user_detail.dart';
import 'package:flutter_music/route/navigate_service.dart';
import 'package:flutter_music/route/routes.dart';
import 'package:flutter_music/widgets/loading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_music/utils/utils.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = 'http://music.521em.cn';

  static void init() async {
    // 获取沙盒路径，用于存储 cookie
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = new PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: false))
      ..interceptors.add(CookieManager(cj))
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      //使用get_it注册popAndPushNamed登录失败跳转路由
      Application.getIt<NavigateService>().popAndPushNamed(Routes.login);
      Utils.showToast('登录失效，请重新登录');
    });
  }

  /// 登录
  static Future<User> login(
      BuildContext context, String phone, String password) async {
    var response = await _get(context, '/login/cellphone', params: {
      'phone': phone,
      'password': password,
    });
    return User.fromJson(response.data);
  }

  static Future<Response> refreshLogin(BuildContext context) async {
    return await _get(context, '/login/refresh', isShowLoading: false)
        .catchError((e) {
      Utils.showToast('网络错误！');
    });
  }

  ///轮播
  static Future<SwiperBanner> getBannerData(BuildContext context) async {
    Response response = await _get(context, '/banner', params: {'type': 1});
    return SwiperBanner.fromJson(response.data);
  }
   
   //获取用户详情信息
  static Future<UserDetail> getUserDetail(BuildContext context,int uid) async{
    Response response = await _get(context, '/user/detail',params: {'uid':uid});
    return UserDetail.fromJson(response.data);
  }
  
}
