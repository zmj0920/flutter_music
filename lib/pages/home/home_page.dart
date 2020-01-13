import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/pages/home/discover/discover_page.dart';
import 'package:flutter_music/pages/home/event/event_page.dart';
import 'package:flutter_music/pages/home/me/me_page.dart';
import 'package:flutter_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  get _drawer => Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('R'),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            )
          ],
        ),

        ///edit end
      );

  void _handlerDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
      appBar: PreferredSize(
        child: AppBar(
        actions: <Widget>[
          IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: ScreenUtil().setWidth(50),
                            color: Colors.black87,
                          ),
                          onPressed: _handlerDrawerButton,
                        ),
        ]
        ),
        preferredSize: Size.zero,
      ),
      backgroundColor: Colors.yellow,
      drawer: _drawer,
      //SafeArea解决不规则屏幕的显示问题
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Padding(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        left: ScreenUtil().setWidth(10),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: ScreenUtil().setWidth(50),
                            color: Colors.black87,
                          ),
                          onPressed: _handlerDrawerButton,
                        ),
                      ),
                      Padding(
                        //EdgeInsets.symmetric(horizontal: val1, vertical: val2): 用于设置水平/垂直方向上的值
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(150)),
                        child: TabBar(
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontSize: 14),
                          //未选中时标签的颜色
                          indicator: UnderlineTabIndicator(),
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: '发现',
                            ),
                            Tab(
                              text: '我的',
                            ),
                            Tab(
                              text: '动态',
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: ScreenUtil().setWidth(20),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: ScreenUtil().setWidth(50),
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            //  NavigatorUtil.goSearchPage(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  VEmptyView(20),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        DiscoverPage(),
                        MePage(),
                        EventPage(),
                      ],
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                  bottom:
                      ScreenUtil().setWidth(80) + Application.bottomBarHeight),
            ),
            // PlayWidget(),
          ],
        ),
      ),
    );
  }
}
