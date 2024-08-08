import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../../constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final GifController _gifController;

  final double _earthMovementScale = 30;
  double _mousePositionX = 0; //(-1 ~ 1)
  double _mousePositionY = 0;

  @override
  void initState() {
    _gifController = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event){
          //중앙을 피벗으로 둠
          setState(() {
            _mousePositionX = (event.position.dx/context.screenSize.width - 0.5)*2; //(-1 ~ 1)
            _mousePositionY = (event.position.dy/context.screenSize.height - 0.5)*2;
          });
        },
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Stack(
              children: [
                AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 300),
                  top: 0-(_earthMovementScale*_mousePositionY),
                  bottom: 0+(_earthMovementScale*_mousePositionY),
                  left: 0-(_earthMovementScale*_mousePositionX),
                  right: 0+(_earthMovementScale*_mousePositionX),
                  child: Gif(
                    image: const AssetImage(AppAssets.BG_EARTH_ANIM),
                    controller: _gifController,
                    autostart: Autostart.loop,
                    fps: 30,
                    placeholder: (context) => const Text('Loading ...'),
                    onFetchCompleted: () {
                      _gifController.reset();
                      _gifController.forward();
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
