import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/model/swiper_banner.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:flutter_music/widgets/v_empty_view.dart';
import 'package:flutter_music/widgets/widget_future_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  /// 构建轮播图
  Widget _buildBanner() {
    return CustomFutureBuilder<SwiperBanner>(
      futureFunc: NetUtils.getBannerData,
      builder: (context, data) {
        return SwiperBannerDiy(
            swiperDataList:
                data.banners.map((e) => '${e.pic}?param=750y260').toList());
      },
    );
  }

  /// 构建分类列表
  Widget _buildHomeCategoryList() {
    var map = {
      '每日推荐': 'images/icon_daily.png',
      '歌单': 'images/icon_playlist.png',
      '排行榜': 'images/icon_rank.png',
      '电台': 'images/icon_radio.png',
      '直播': 'images/icon_look.png',
    };

    var keys = map.keys.toList();
    var width = ScreenUtil().setWidth(100);

    return GridView.custom(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 10),
      //表格委托 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //显示个数
        crossAxisCount: keys.length,
       // child的宽高比
        childAspectRatio: 1 / 1.1,
      ),
      //通过 List 来构建 item 
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          //手势控制
          return GestureDetector(
            //自己和child都可以接收事件
            behavior: HitTestBehavior.translucent,
            onTap: () {
              switch (index) {
                case 0:
                  //   NavigatorUtil.goDailySongsPage(context);
                  break;
                case 2:
                  //  NavigatorUtil.goTopListPage(context);
                  break;
              }
            },
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: width,
                      height: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width / 2),
                          border: Border.all(color: Colors.black12, width: 0.5),
                          //渐变色
                          gradient: RadialGradient(
                            colors: [
                              Color(0xFFFF8174),
                              Colors.red,
                            ],
                            center: Alignment(-1.7, 0),
                            radius: 1,
                          ),
                          color: Colors.red),
                    ),
                    Image.asset(
                      map[keys[index]],
                      width: width,
                      height: width,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: keys[index] == '每日推荐'
                          ? Text(
                              '${DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(''),
                    )
                  ],
                ),
                VEmptyView(10),
                Text(
                  '${keys[index]}',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          );
        },
        childCount: keys.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBanner(),
              VEmptyView(40),
              _buildHomeCategoryList()
            ],
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// 首页轮播组件编写
class SwiperBannerDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperBannerDiy({Key key, this.swiperDataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network("${swiperDataList[index]}",
                    fit: BoxFit.fill));
          },
          itemWidth: ScreenUtil().setWidth(750),
          itemHeight: ScreenUtil().setHeight(260),
          itemCount: swiperDataList.length,
          autoplay: true,
          layout: SwiperLayout.TINDER,
          onTap: (int index) {
            print(index);
          }),
    );
  }
}
