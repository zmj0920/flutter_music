import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List swiperList = [
    {
      "id": 1,
      "imageUrl":
          'http://p1.music.126.net/xK9XxS6m7ilytVvlgIBzGw==/109951164624752095.jpg?param=750y260',
    },
    {
      "id": 2,
      "imageUrl":
          'http://p1.music.126.net/tjQHoq3b-qZ09Jck1iYWcw==/109951164624226015.jpg?param=750y260',
    },
    {
      "id": 3,
      "imageUrl":
          'http://p1.music.126.net/TmXOYu2M-kmc6ckFt0-kCg==/109951164623762709.jpg?param=750y260',
    },
    {
      "id": 4,
      "imageUrl":
          'http://p1.music.126.net/3tjUHEe1F-jnrNUCoCq1zw==/109951164624414213.jpg?param=750y260',
    },
    {
      "id": 5,
      "imageUrl":
          'http://p1.music.126.net/t-MdVrGiHTvZNzBnP5tSKA==/109951164623773287.jpg?param=750y260',
    },
    {
      "id": 6,
      "imageUrl":
          'http://p1.music.126.net/Fu7Ybqn92imLRgnguu8Rbg==/109951164623778781.jpg?param=750y260',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SwiperBannerDiy(swiperDataList: this.swiperList),
            ],
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
                child: Image.network("${swiperDataList[index]['imageUrl']}",
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
