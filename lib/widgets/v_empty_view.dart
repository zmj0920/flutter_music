// 纵向空组件（用于占位）

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VEmptyView extends StatelessWidget {
  final double height;

  VEmptyView(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setWidth(height),
    );
  }
}
