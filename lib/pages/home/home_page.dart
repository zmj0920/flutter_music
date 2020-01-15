import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home/discover/discover_page.dart';
import 'package:flutter_music/pages/home/event/event_page.dart';
import 'package:flutter_music/pages/home/me/me_page.dart';
import 'package:flutter_music/pages/home/video/video_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black87,  fontFamily: "Courier",),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          //未选中时标签的颜色
          indicator: UnderlineTabIndicator(),
          indicatorWeight: 1,
          controller: _tabController,
          tabs: [
            Tab(
              text: '我的',
            ),
            Tab(
              text: '发现',
            ),
            Tab(
              text: '动态',
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

  @override
  bool get wantKeepAlive => true;
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
