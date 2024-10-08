import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../appbar/glassy_appbar.dart';
import '../boxes/max_width_box.dart';


class ResponsiveGlassyScaffold extends StatefulWidget {

  final Widget? appbarTitle;
  final Widget body;
  final double topPosition;
  final Function(bool)? onChangedPageState;
  final Function(ScrollNotification)? onNotificationScroll;
  final bool? isTranparentAppbar;
  final Function? onPressedBack;

  const ResponsiveGlassyScaffold({super.key, required this.body, this.topPosition = 0, this.appbarTitle, this.onChangedPageState, this.onNotificationScroll, this.isTranparentAppbar, this.onPressedBack});

  @override
  State<ResponsiveGlassyScaffold> createState() => _ResponsiveGlassyScaffoldState();
}

class _ResponsiveGlassyScaffoldState extends State<ResponsiveGlassyScaffold> with SingleTickerProviderStateMixin {

  late final AnimationController _bodyAnimationController;
  bool _isTop = true;

  @override
  void initState() {
    _bodyAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onChangedPageState(bool isTop){
    //상태 변경당 1회 실행되도록
    setState(() {
      _isTop = isTop;
    });
    if(widget.onChangedPageState != null) {
      widget.onChangedPageState!(isTop);
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value){
        _bodyAnimationController.forward();
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              ///BODY
              Positioned.fill(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    bool isTop = true;
                    if (notification.metrics.pixels <= widget.topPosition) {
                      isTop = true;
                    } else {
                      isTop = false;
                    }
                    if (_isTop != isTop) {
                      _onChangedPageState(isTop);
                    }

                    if(widget.onNotificationScroll != null) {
                      widget.onNotificationScroll!(notification);
                    }
                    //print(notification.metrics.pixels/notification.metrics.maxScrollExtent);

                    return true;
                  },
                  child: widget.body
                ),
              ).animate(
                effects: [
                  const FadeEffect( //나갈때 페이드아웃 효과
                    begin: 1,
                    end: 0,
                    curve: Curves.decelerate,
                    duration: Duration(milliseconds: 300),
                  )
                ],
                autoPlay: false,
                controller: _bodyAnimationController
              ),

              ///AppBar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: MaxSizedBox(
                  child: GlassyAppbar(
                    isTransparentBackground: widget.isTranparentAppbar??_isTop,
                    title: widget.appbarTitle??const SizedBox(),
                    onPressedBack: widget.onPressedBack,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
