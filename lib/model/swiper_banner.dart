class SwiperBanner {
  List<Banners> banners;
  int code;

  SwiperBanner({this.banners, this.code});
  
  SwiperBanner.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Banners {
  String pic;
  int targetId;
  int targetType;
  Banners({
    this.pic,
    this.targetId,
    this.targetType,
  });

  Banners.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    targetId = json['targetId'];
    targetType = json['targetType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['targetId'] = this.targetId;
    data['targetType'] = this.targetType;
  }
}
