import 'package:flutter/material.dart';
import 'package:flutter_music/model/swiper_banner.dart';
import 'package:flutter_music/utils/net_utils.dart';
import 'package:flutter_music/widgets/widget_banner.dart';
import 'package:flutter_music/widgets/widget_future_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _HomePrePageState createState() => _HomePrePageState();
}

class _HomePrePageState extends State<DiscoverPage>
    with TickerProviderStateMixin,  AutomaticKeepAliveClientMixin {


  /// 构建轮播图
  Widget _buildBanner() {
    return CustomFutureBuilder<SwiperBanner>(
      futureFunc: NetUtils.getBannerData,
      builder: (context, data) {
        return CustomBanner(data.banners.map((e) => '${e.pic}?param=540y210').toList());
      },
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
            _buildBanner()
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
