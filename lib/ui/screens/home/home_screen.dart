import 'package:aboutme/constants/app_assets.dart';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/screens/contact/contact_screen.dart';
import 'package:aboutme/ui/screens/projects/projects_screen.dart';
import 'package:aboutme/ui/screens/skills/skills_screen.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/watch_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../app_router.dart';
import '../introduction/introduction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  ///페이지 전환 애니메이션의 방향이 전환됨에 따라 홈화면의 복귀 애니메이션의 방향도 변경하기 위해 추가한 정적 변수
  static MovePageDirection dynamicCurrentDirection = MovePageDirection.topLeft;

  MovePageTransition getHomeScreenTransition({animation, secondaryAnimation, state, child}) {
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet =
        ResponsiveValue<bool>(context, defaultValue: false, conditionalValues: [const Condition.smallerThan(name: TABLET, value: true)]).value;
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
                  child: const Center(child: EarthBackground()),
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GlassySectorButton(
                                sectorTitle: const Text('Who am I ?'),
                                icon: Icons.person,
                                isTablet: isTablet,
                                delayMs: 2000,
                                onTap: () async {
                                  HomeScreen.dynamicCurrentDirection = MovePageDirection.topLeft;
                                  await context.pushNamed(IntroductionScreen.routeName);
                                },
                              ),
                              GlassySectorButton(
                                sectorTitle: const Text('Skills'),
                                icon: Icons.electric_bolt,
                                isTablet: isTablet,
                                delayMs: 3000,
                                onTap: () async {
                                  HomeScreen.dynamicCurrentDirection = MovePageDirection.topRight;
                                  await context.pushNamed(SkillsScreen.routeName);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GlassySectorButton(
                                sectorTitle: const Text('Projects'),
                                icon: Icons.newspaper_outlined,
                                isTablet: isTablet,
                                delayMs: 2500,
                                onTap: () async {
                                  HomeScreen.dynamicCurrentDirection = MovePageDirection.bottomLeft;
                                  await context.pushNamed(ProjectsScreen.routeName);
                                },
                              ),
                              GlassySectorButton(
                                sectorTitle: const Text('Contact'),
                                icon: Icons.email,
                                isTablet: isTablet,
                                delayMs: 3500,
                                onTap: () async {
                                  HomeScreen.dynamicCurrentDirection = MovePageDirection.bottomRight;
                                  await context.pushNamed(ContactScreen.routeName);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(),
                        ],
                      ))),
              const Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: WatchWidget(),
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
                    ),
                    Text(
                      ' ME',
                      style: TextStyle(
                          color: context.colorScheme.onSurface.withOpacity(0.8),
                          fontSize: context.getResponsiveValue<double>(30, 20),
                          fontWeight: FontWeight.w500),
                    )
                  ]))
            ],
          )),
    );
  }
}

/// 홈 화면 배경의 지구본.
///
/// 애니메이션 WebP는 용량이 커서 전부 내려받은 뒤에야 첫 프레임이 나온다.
/// 그동안 화면이 비어 보이지 않도록, 같은 첫 프레임을 담은 가벼운 정지 이미지를
/// 먼저 띄우고 애니메이션이 준비되면 그 자리에서 바로 교체한다.
/// 두 이미지의 첫 프레임이 동일하므로 교체 순간 튀지 않는다.
class EarthBackground extends StatefulWidget {
  const EarthBackground({super.key});

  @override
  State<EarthBackground> createState() => _EarthBackgroundState();
}

class _EarthBackgroundState extends State<EarthBackground> {
  ///지구본이 처음 나타날 때의 확대 연출 트리거
  bool _isVisible = false;
  bool _isVisibleScheduled = false;

  ///포스터와 애니메이션 중 먼저 준비된 쪽이 등장 연출을 시작시킨다.
  void _markVisible() {
    if (_isVisibleScheduled) {
      return;
    }
    _isVisibleScheduled = true;
    // frameBuilder는 build 도중에 호출되므로 setState는 프레임이 끝난 뒤로 미룬다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _isVisible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(AppAssets.BG_EARTH_ANIM),
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSyncLoaded) {
        //frame이 null이면 아직 애니메이션 디코딩 전이다.
        final bool isAnimationReady = wasSyncLoaded || frame != null;
        if (isAnimationReady) {
          _markVisible();
        }
        return AnimatedScale(
          scale: _isVisible ? 1 : 0,
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut,
          child: isAnimationReady ? child : _buildPoster(),
        );
      },
    );
  }

  Widget _buildPoster() {
    return Image(
      image: const AssetImage(AppAssets.BG_EARTH_POSTER),
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSyncLoaded) {
        if (wasSyncLoaded || frame != null) {
          _markVisible();
        }
        return child;
      },
    );
  }
}

class GlassySectorButton extends StatelessWidget {
  // ignore: use_super_parameters
  const GlassySectorButton({Key? key, required this.sectorTitle, required this.icon, required this.onTap, required bool this.isTablet, required this.delayMs})
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
              backgroundColorOpacity: 0.9,
              borderRadius: borderRadius,
              width: 200 * (isTablet ? 0.8 : 1.5),
              height: 100 * (isTablet ? 0.8 : 1.5),
              child: Center(
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: isTablet ? 15 : 30, fontWeight: FontWeight.w900, color: context.colorScheme.onSurface),
                  child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    sectorTitle ?? const SizedBox(),
                    Icon(icon, size: isTablet ? 30 : 60, color: context.colorScheme.onSurface),
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
