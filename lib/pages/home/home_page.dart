import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/model/user.dart';
import 'package:flutter_music/model/user_detail.dart';
import 'package:flutter_music/pages/home/discover/discover_page.dart';
import 'package:flutter_music/pages/home/event/event_page.dart';
import 'package:flutter_music/pages/home/me/me_page.dart';
import 'package:flutter_music/pages/home/video/video_page.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:flutter_music/widgets/widget_future_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  User _user = User.fromJson(json.decode(Application.sp.getString('user')));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    // WidgetsBinding.instance.addPostFrameCallback((call) {
    //   _request();
    // });
  }

  Widget _buildUserDetail() {
    return CustomFutureBuilder<UserDetail>(
        futureFunc: NetUtils.getUserDetail,
        params: {'uid': _user.profile.userId},
        builder: (context, userDetail) {
          print(userDetail.profile.avatarUrl);
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: DrawerHeader(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(195, 20, 50, 0.8),
                            Color.fromRGBO(36, 11, 54, 1),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child:  Stack(children: <Widget>[
                        /* 用stack来放背景图片 */
                        // new Image.network(
                        //   userDetail.profile.avatarUrl,
                        //   fit: BoxFit.fill,
                        //   width: double.infinity,
                        // ),
                        new Align(
                          /* 先放置对齐 */
                          alignment: FractionalOffset.bottomLeft,
                          child: Container(
                            height: ScreenUtil().setHeight(180.0),
                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20.0), bottom: ScreenUtil().setHeight(12.0)),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              /* 宽度只用包住子组件即可 */
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                 CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(userDetail.profile.avatarUrl),
                                  radius: 35.0,
                                ),
                                 Container(
                                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(15.0)),
                                  child:  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start, // 水平方向左对齐
                                    mainAxisAlignment:
                                        MainAxisAlignment.center, // 竖直方向居中
                                    children: <Widget>[
                                       Text(
                                        userDetail.profile.nickname,
                                        style:  TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      // new Text(
                                      //   "What's up",
                                      //   style: new TextStyle(
                                      //       fontSize: 14.0,
                                      //       color: Colors.white),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.home)),
                title: Text("创作中心"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.people)),
                title: Text("听歌识曲"),
                onTap: () {
                  Navigator.of(context).pop(); //隐藏侧边栏
                  Navigator.pushNamed(context, '/user');
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.settings)),
                title: Text("定时播放"),
              ),
              Divider(),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: _buildUserDetail(),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: ScreenUtil().setWidth(50),
              color: Colors.black87,
            ),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarViewDelegate());
            },
          ),
        ],
        title: TabBar(
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontFamily: "Courier",
          ),
          unselectedLabelStyle: TextStyle(fontSize: 14),
          //未选中时标签的颜色
          indicator: UnderlineTabIndicator(),
          controller: _tabController,
          tabs: [
            Tab(
              text: '我的',
            ),
            Tab(
              text: '发现',
            ),
            Tab(
              text: '云村',
            ),
            Tab(
              text: '视频',
            ),
          ],
        ),
      ),
      //  backgroundColor: Colors.red,
      //SafeArea解决不规则屏幕的显示问题
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [MePage(), DiscoverPage(), EventPage(), VideoPage()],
        ),
      ),
    );
  }
}

class SearchBarViewDelegate extends SearchDelegate<String> {
  String searchHint = "请输入搜索内容...";
  var sourceList = [
    "dart",
    "dart 入门",
    "flutter",
    "flutter 编程",
    "flutter 编程开发",
  ];

  var suggestList = ["flutter", "flutter 编程开发"];

  @override
  String get searchFieldLabel => searchHint;

  @override
  List<Widget> buildActions(BuildContext context) {
    ///显示在最右边的控件列表
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";

          ///搜索建议的内容
          showSuggestions(context);
        },
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          print(query);
          //query = "";
        },
      )
    ];
  }

  ///左侧带动画的控件，一般都是返回
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),

      ///调用 close 关闭 search 界面
      onPressed: () => close(context, null),
    );
  }

  ///展示搜索结果
  @override
  Widget buildResults(BuildContext context) {
    List<String> result = List();

    ///模拟搜索过程
    for (var str in sourceList) {
      ///query 就是输入框的 TextEditingController
      if (query.isNotEmpty && str.contains(query)) {
        result.add(str);
      }
    }

    ///展示搜索结果
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
              child: ListTile(
                title: Text(result[index]),
              ),
              onTap: () {
                searchHint = "";
                query = result[index].toString();
                showResults(context);
              },
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggest = query.isEmpty
        ? suggestList
        : sourceList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: ListTile(
          title: RichText(
            text: TextSpan(
              text: suggest[index].substring(0, query.length),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggest[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          searchHint = "";
          query = suggest[index].toString();
          showResults(context);
        },
      ),
    );
  }
}
