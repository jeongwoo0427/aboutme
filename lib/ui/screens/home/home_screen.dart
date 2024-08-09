import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final GifController _gifController;
  late final AnimationController _earthAnimationController;

  final double _earthMovementScale = 30;
  final double _starsMovementScale = -15;
  double _mousePositionX = 0; //(-1 ~ 1)
  double _mousePositionY = 0;

  @override
  void initState() {
    _gifController = GifController(vsync: this);
    _earthAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          //중앙을 피벗으로 둠
          setState(() {
            _mousePositionX = (event.position.dx / context.screenSize.width - 0.5) * 2; //(-1 ~ 1)
            _mousePositionY = (event.position.dy / context.screenSize.height - 0.5) * 2;
          });
        },
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xFF1A012D),
                //     Color(0xFF000549),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //
                // ),
                ),
            child: Stack(
              children: [
                // AnimatedPositioned(
                //     curve: Curves.decelerate,
                //     duration: const Duration(milliseconds: 400),
                //     top: 0 - (_starsMovementScale * _mousePositionY),
                //     bottom: 0 + (_starsMovementScale * _mousePositionY),
                //     left: 0 - (_starsMovementScale * _mousePositionX),
                //     right: 0 + (_starsMovementScale * _mousePositionX),
                //     child: SizedBox(
                //         width: 200,
                //         child: Image.asset(
                //           AppAssets.BG_WHITE_STARS,
                //           fit: BoxFit.cover,
                //         ))),

                AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 400),
                  top: 0 - (_earthMovementScale * _mousePositionY),
                  bottom: 0 + (_earthMovementScale * _mousePositionY),
                  left: 0 - (_earthMovementScale * _mousePositionX),
                  right: 0 + (_earthMovementScale * _mousePositionX),
                  child: Gif(
                    image: const AssetImage(AppAssets.BG_EARTH_ANIM),
                    fit: BoxFit.contain,
                    controller: _gifController,
                    autostart: Autostart.loop,
                    fps: 30,
                    placeholder: (context) => const Center(child: Text('Loading ...')),
                    onFetchCompleted: () {
                      _gifController.reset();
                      _gifController.forward();
                      _earthAnimationController.forward();
                    },
                  ).animate(autoPlay: false, controller: _earthAnimationController, effects: [
                    ScaleEffect(begin: Offset(0, 0), end: Offset(1, 1), duration: Duration(milliseconds: 1500), curve: Curves.decelerate),
                  ]),
                ),
                Positioned(
                    left: 15,
                    top: 15,
                    child: Row(children: [
                      Text(
                        'About',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize:
                                ResponsiveValue<double>(context, defaultValue: 30, conditionalValues: [Condition.smallerThan(name: TABLET, value: 20)]).value,
                            fontWeight: FontWeight.w100),
                      ).animate(
                        delay: Duration(milliseconds: 1500),
                        effects: [
                          BlurEffect(begin: Offset(100, 100), end: Offset(0, 0), duration: Duration(milliseconds: 1300)),
                        ],
                      ),
                      Text(
                        ' KJW',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize:
                                ResponsiveValue<double>(context, defaultValue: 30, conditionalValues: [Condition.smallerThan(name: TABLET, value: 20)]).value,
                            fontWeight: FontWeight.w700),
                      ).animate(
                        delay: Duration(milliseconds: 2500),
                        effects: [
                          BlurEffect(begin: Offset(100, 100), end: Offset(0, 0), duration: Duration(milliseconds: 1300)),
                        ],
                      )
                    ]))
              ],
            )),
      ),
    );
  }
}
