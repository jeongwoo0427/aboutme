import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/screens/contact/contact_screen.dart';
import 'package:aboutme/ui/screens/projects/projects_screen.dart';
import 'package:aboutme/ui/screens/skills/skills_screen.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/watch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../app_router.dart';
import '../../../constants/app_assets.dart';
import '../introduction/introduction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  ///페이지 전환 애니메이션의 방향이 전환됨에 따라 홈화면의 복귀 애니메이션의 방향도 변경하기 위해 추가한 정적 변수
  static MovePageDirection dynamicCurrentDirection = MovePageDirection.topLeft;

  MovePageTransition getHomeScreenTransition(
      {animation, secondaryAnimation, state, child}) {
    return MovePageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      direction: dynamicCurrentDirection,
      child: child,
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = ResponsiveValue<bool>(context,
        defaultValue: false,
        conditionalValues: [
          const Condition.smallerThan(name: TABLET, value: true)
        ]).value;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 30,
                bottom: -30,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(context.getResponsiveValue(100, 10)),
                  child: Center(child: Image.asset(AppAssets.BG_EARTH_ANIM,fit: BoxFit.cover,))
                      .animate(
                      autoPlay: true,
                      delay: 1500.ms,
                      effects: [
                        ScaleEffect(
                            begin: Offset(0, 0),
                            end: Offset(1, 1),
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.decelerate),
                      ]),
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
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
                                sectorTitle: Text('Who am I ?'),
                                icon: Icons.person,
                                isTablet: isTablet,
                                delayMs: 2000,
                                onTap: _isBusy
                                    ? null
                                    : () async {
                                        HomeScreen.dynamicCurrentDirection =
                                            MovePageDirection.topLeft;
                                        await context.pushNamed(
                                            IntroductionScreen.routeName);
                                      },
                              ),
                              GlassySectorButton(
                                sectorTitle: Text('Skills'),
                                icon: Icons.electric_bolt,
                                isTablet: isTablet,
                                delayMs: 3000,
                                onTap: _isBusy
                                    ? null
                                    : () async {
                                        HomeScreen.dynamicCurrentDirection =
                                            MovePageDirection.topRight;
                                        await context
                                            .pushNamed(SkillsScreen.routeName);
                                      },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GlassySectorButton(
                                sectorTitle: Text('Projects'),
                                icon: Icons.newspaper_outlined,
                                isTablet: isTablet,
                                delayMs: 2500,
                                onTap: _isBusy
                                    ? null
                                    : () async {
                                        HomeScreen.dynamicCurrentDirection =
                                            MovePageDirection.bottomLeft;
                                        await context.pushNamed(
                                            ProjectsScreen.routeName);
                                      },
                              ),
                              GlassySectorButton(
                                sectorTitle: Text('Contact'),
                                icon: Icons.email,
                                isTablet: isTablet,
                                delayMs: 3500,
                                onTap: _isBusy
                                    ? null
                                    : () async {
                                        HomeScreen.dynamicCurrentDirection =
                                            MovePageDirection.bottomRight;
                                        await context
                                            .pushNamed(ContactScreen.routeName);
                                      },
                              ),
                            ],
                          ),
                          SizedBox(),
                        ],
                      )).animate().fadeIn(duration: 1000.ms)
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: WatchWidget().animate().fadeIn(
                    curve: Curves.decelerate, duration: 500.ms, delay: 2000.ms),
              ),
              Positioned(
                  left: 15,
                  top: 15,
                  child: Row(children: [
                    Text(
                      'About',
                      style: TextStyle(
                          color: context.colorScheme.onSurface.withOpacity(0.8),
                          fontSize: context.getResponsiveValue<double>(30, 20),
                          fontWeight: FontWeight.w200),
                    ).animate(
                      autoPlay: true,
                      delay: Duration(milliseconds: 3000),
                      effects: [
                        BlurEffect(
                            begin: Offset(100, 30),
                            end: Offset(0, 0),
                            duration: Duration(milliseconds: 1500)),
                      ],
                    ),
                    Text(
                      ' ME',
                      style: TextStyle(
                          color: context.colorScheme.onSurface.withOpacity(0.8),
                          fontSize: context.getResponsiveValue<double>(30, 20),
                          fontWeight: FontWeight.w500),
                    ).animate(
                        autoPlay: true,
                        delay: Duration(milliseconds: 4000),
                        effects: [
                          BlurEffect(
                              begin: Offset(100, 30),
                              end: Offset(0, 0),
                              duration: Duration(milliseconds: 1500)),
                        ],
                        onComplete: (_) {
                          _setBusyState(false);
                        })
                  ]))
            ],
          )),
    );
  }

  void _setBusyState(bool isBusy) {
    setState(() {
      _isBusy = isBusy;
    });
  }

  void _setTitleState({required bool show}) {}
}

class GlassySectorButton extends StatelessWidget {
  GlassySectorButton(
      {Key? key,
      required this.sectorTitle,
      required this.icon,
      required this.onTap,
      required bool this.isTablet,
      required this.delayMs})
      : super(key: key);

  final Widget? sectorTitle;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isTablet;
  final int delayMs;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: context.colorScheme.onSurface.withOpacity(0.3),
          onTap: onTap,
          child: GlassyContainer(
            borderRadius: borderRadius,
            width: 200 * (isTablet ? 0.8 : 1.5),
            height: 100 * (isTablet ? 0.8 : 1.5),
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: isTablet ? 15 : 30,
                    fontWeight: FontWeight.w900,
                    color: context.colorScheme.onSurface),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      sectorTitle ?? SizedBox(),
                      Icon(icon,
                          size: isTablet ? 30 : 60,
                          color: context.colorScheme.onSurface),
                    ]),
              ),
            ),
          )
              // .animate(
              // autoPlay: true,
              // delay: Duration(milliseconds: widget.delayMs),
              // onComplete: (controller) {
              //   setState(() {
              //     _loadComplete = true;
              //   });
              // },
              // effects: [
              //   BlurEffect(
              //       begin: Offset(90, 0),
              //       end: Offset(0, 0),
              //       duration: Duration(milliseconds: 1000),
              //       curve: Curves.decelerate),
              //   FadeEffect(
              //       begin: 0, end: 1, duration: Duration(milliseconds: 500))
              // ]),
        ),
      ),
    );
  }
}
