// 网络请求组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/widget_net.error.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

/// FutureBuilder 简单封装，除正确返回和错误外，其他返回 小菊花
/// 错误时返回定义好的错误 Widget，例如点击重新请求
class CustomFutureBuilder<T> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final Function futureFunc;
  final Map<String, dynamic> params;

  CustomFutureBuilder({
    @required this.futureFunc,
    @required this.builder,
    this.params,
  });

  @override
  _CustomFutureBuilderState<T> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  Future<T> _future;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _request();
    });
  }

  void _request() {
    setState(() {
      if (widget.params == null)
        _future = widget.futureFunc(context);
      else
        _future = widget.futureFunc(context, params: widget.params);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _future == null
        ? Container(
            alignment: Alignment.center,
            height: ScreenUtil().setWidth(200),
            child: CupertinoActivityIndicator(),
          )
        : FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setWidth(200),
                    child: CupertinoActivityIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return widget.builder(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return NetErrorWidget(
                      callback: () {
                        _request();
                      },
                    );
                  }
              }
              return Container();
            },
          );
  }
}
