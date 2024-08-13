import 'package:flutter/material.dart';

import '../appbar/glassy_appbar.dart';
import '../constrained/max_width_box.dart';

class ResponsiveGlassyScaffold extends StatefulWidget {

  final Widget? appbarTitle;
  final Widget body;

  const ResponsiveGlassyScaffold({super.key, required this.body, this.appbarTitle});

  @override
  State<ResponsiveGlassyScaffold> createState() => _ResponsiveGlassyScaffoldState();
}

class _ResponsiveGlassyScaffoldState extends State<ResponsiveGlassyScaffold> {

  bool _isTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned.fill(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  bool isTop = true;
                  if (notification.metrics.pixels <= 100) {
                    isTop = true;
                  } else {
                    isTop = false;
                  }
                  if (_isTop != isTop) {
                    //상태 변경당 1회 실행되도록
                    setState(() {
                      _isTop = isTop;
                    });
                  }

                  return true;
                },
                child: widget.body
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MaxWidthBox(
                child: GlassyAppbar(
                  isTransparentBackground: _isTop,
                  title: widget.appbarTitle??const SizedBox(),
                ),
              ),
            ),
          ],
        ));
  }
}
