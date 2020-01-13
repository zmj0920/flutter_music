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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
        ),
        preferredSize: Size.zero,
      ),
      backgroundColor: Colors.yellow,
      
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
                          onPressed: () {
                            //  NavigatorUtil.goSearchPage(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(150)),
                        child: TabBar(
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontSize: 14),
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
              padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(80) + Application.bottomBarHeight),
            ),
            // PlayWidget(),
          ],
        ),
      ),
    );
  }
}
