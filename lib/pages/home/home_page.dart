import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/model/user.dart';
import 'package:flutter_music/pages/home/discover/discover_page.dart';
import 'package:flutter_music/pages/home/event/event_page.dart';
import 'package:flutter_music/pages/home/me/me_page.dart';
import 'package:flutter_music/pages/home/video/video_page.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

    User user = User.fromJson(json.decode(Application.sp.getString('user')));
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    
    print("2222");
    print(user.profile.userId);
       NetUtils.getUserDetail(context,user.profile.userId);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text("君吟"),
                  accountEmail: Text("id123456"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://user-gold-cdn.xitu.io/2019/9/4/16cfa3238800341b?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1"),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://p2.music.126.net/bmA_ablsXpq3Tk9HlEg9sA==/2002210674180203.jpg"),
                    fit: BoxFit.cover,
                  )),
                  otherAccountsPictures: <Widget>[],
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("我的空间"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.people)),
              title: Text("用户中心"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
                Navigator.pushNamed(context, '/user');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("设置中心"),
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.menu, size: ScreenUtil().setWidth(50)),
        //     onPressed: () => debugPrint('Navigation button is pressed.')),
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
