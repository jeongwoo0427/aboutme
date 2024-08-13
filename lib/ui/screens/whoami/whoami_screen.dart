import 'package:aboutme/ui/widgets/appbar/glassy_appbar.dart';
import 'package:aboutme/ui/widgets/constrained/max_width_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  static const String routeName = 'WhoAmI';

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {

  final ScrollController _scrollController = ScrollController();
  bool _isTop = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned.fill(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification){
                  bool isTop = true;
                  if(notification.metrics.pixels<=100){
                    isTop = true;
                  }else{
                    isTop = false;
                  }
                  if(_isTop != isTop){ //상태 변경당 1회 실행되도록
                    print(isTop);
                    setState(() {
                      _isTop = isTop;
                    });
                  }

                  return true;
                },
                child: SingleChildScrollView(

                  child: Column(
                    children: [
                      SizedBox(height : 1500),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MaxWidthBox(
                child: GlassyAppbar(
                  isTransparentBackground: _isTop,
                  title: Text('Who am I ?'),
                ),
              ),
            ),
          ],
        ));
  }
}
