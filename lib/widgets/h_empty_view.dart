//横向空组件（用于占位）
import 'package:flutter/material.dart';

class HEmptyView extends StatelessWidget {
  final double width;

  HEmptyView(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}
