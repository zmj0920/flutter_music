import 'package:flutter/material.dart';
import 'package:flutter_music/model/swiper_banner.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:flutter_music/widgets/widget_future_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildBanner()],
          ),
        ));
  }
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
