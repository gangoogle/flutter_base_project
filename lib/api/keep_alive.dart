import 'package:flutter/cupertino.dart';

class PagerKeepAliveWrapper extends StatefulWidget {
  const PagerKeepAliveWrapper({
    super.key,
    this.keepAlive = true,
    required this.child,
  });
  final bool keepAlive;
  final Widget child;

  @override
  _PagerKeepAliveWrapperState createState() => _PagerKeepAliveWrapperState();
}

class _PagerKeepAliveWrapperState extends State<PagerKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant PagerKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
