import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
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
  late final AnimationController _aboutTextAnimationContrller;
  late final AnimationController _kjwTextAnimationContrller;
  late final AnimationController _earthAnimationController;

  final double _cardsMovemnetScale = 50;
  final double _earthMovementScale = 30;
  final double _starsMovementScale = -15;
  double _mousePositionX = 0; //(-1 ~ 1)
  double _mousePositionY = 0;

  @override
  void initState() {
    _gifController = GifController(vsync: this);
    _aboutTextAnimationContrller = AnimationController(vsync: this);
    _kjwTextAnimationContrller = AnimationController(vsync: this);
    _earthAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet =
        ResponsiveValue<bool>(context, defaultValue: false, conditionalValues: [const Condition.smallerThan(name: TABLET, value: true)]).value;
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
                  top: 30 - (_earthMovementScale * _mousePositionY),
                  bottom: -30 + (_earthMovementScale * _mousePositionY),
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
                AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 400),
                    top: 0 - (_cardsMovemnetScale * _mousePositionY),
                    bottom: 0 + (_cardsMovemnetScale * _mousePositionY),
                    left: 0 - (_cardsMovemnetScale * _mousePositionX),
                    right: 0 + (_cardsMovemnetScale * _mousePositionX),
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GlassySectorButton(
                                  sectorName: 'Who am i?',
                                  icon: Icons.person,
                                  isTablet: isTablet,
                                  delayMs: 2000,
                                ),
                                GlassySectorButton(
                                  sectorName: 'Skills',
                                  icon: Icons.electric_bolt,
                                  isTablet: isTablet,
                                  delayMs: 3000,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GlassySectorButton(
                                  sectorName: 'Projects',
                                  icon: Icons.newspaper_outlined,
                                  isTablet: isTablet,
                                  delayMs: 2500,
                                ),
                                GlassySectorButton(
                                  sectorName: 'Contact',
                                  icon: Icons.email,
                                  isTablet: isTablet,
                                  delayMs: 3500,
                                ),
                              ],
                            ),
                            SizedBox(),
                          ],
                        ))),

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
                            fontWeight: FontWeight.w200),
                      ).animate(
                        controller: _aboutTextAnimationContrller,
                        autoPlay: true,
                        delay: Duration(milliseconds: 3800),
                        effects: [
                          BlurEffect(begin: Offset(50, 30), end: Offset(0, 0), duration: Duration(milliseconds: 1000)),
                        ],
                      ),
                      Text(
                        ' KJW',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize:
                                ResponsiveValue<double>(context, defaultValue: 30, conditionalValues: [Condition.smallerThan(name: TABLET, value: 20)]).value,
                            fontWeight: FontWeight.w500),
                      ).animate(
                        controller: _kjwTextAnimationContrller,
                        autoPlay: true,
                        delay: Duration(milliseconds: 4400),
                        effects: [
                          BlurEffect(begin: Offset(50, 30), end: Offset(0, 0), duration: Duration(milliseconds: 1000)),
                        ],
                      )
                    ]))
              ],
            )),
      ),
    );
  }

  void setTitleState({required bool show}) {}
}

class GlassySectorButton extends StatelessWidget {
  const GlassySectorButton({Key? key, required this.sectorName, required this.icon, required bool this.isTablet, required this.delayMs}) : super(key: key);

  final String sectorName;
  final IconData icon;
  final bool isTablet;
  final int delayMs;


  @override
  Widget build(BuildContext context) {
    return GlassyContainer(
      width: 200 * (isTablet ? 1 : 1.5),
      height: 100 * (isTablet ? 1 : 1.5),
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: isTablet ? 20 : 30, fontWeight: FontWeight.w900, color: Colors.white.withOpacity(0.9)),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text(sectorName), Icon(icon,size: isTablet ? 40 : 60,color: Colors.white.withOpacity(0.9),)]),
        ),
      ),
    ).animate(
      autoPlay: true,
      delay: Duration(milliseconds: delayMs),
      effects: [
        BlurEffect(begin: Offset(90,0), end: Offset(0,0), duration: Duration(milliseconds: 1000),curve: Curves.decelerate),
        FadeEffect(begin: 0, end: 1, duration: Duration(milliseconds: 500))
      ]
    );
  }
}
