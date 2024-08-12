import 'package:aboutme/ui/screens/contact/contact_screen.dart';
import 'package:aboutme/ui/screens/home/home_screen.dart';
import 'package:aboutme/ui/screens/projects/projects_screen.dart';
import 'package:aboutme/ui/screens/skills/skills_screen.dart';
import 'package:aboutme/ui/screens/whoami/whoami_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      pageBuilder: (context, state) {
        const HomeScreen homeScreen = HomeScreen();
        return CustomTransitionPage(
            key: state.pageKey,
            child: homeScreen,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return homeScreen.getHomeScreenTransition(animation: animation, secondaryAnimation: secondaryAnimation, state: state, child: child);
            });
      },
      // routes: <RouteBase>[
      //   // GoRoute(
      //   //   name: ManageQuizScreen.routeName,
      //   //   path: 'create-quiz',
      //   //   pageBuilder: customPageBuilder(
      //   //     const ManageQuizScreen(
      //   //       manageMode: ManageMode.create,
      //   //     ),
      //   //   ),
      //   // ),
      // ],
    ),
    GoRoute(
      name: WhoAmIScreen.routeName,
      path: '/who-am-i',
      pageBuilder: customPageBuilder(const WhoAmIScreen(), movePageDirection: MovePageDirection.topLeft),
    ),
    GoRoute(
      name: SkillsScreen.routeName,
      path: '/skills',
      pageBuilder: customPageBuilder(const SkillsScreen(), movePageDirection: MovePageDirection.topRight),
    ),
    GoRoute(
      name: ProjectsScreen.routeName,
      path: '/projects',
      pageBuilder: customPageBuilder(const ProjectsScreen(), movePageDirection: MovePageDirection.bottomLeft),
    ),
    GoRoute(
      name: ContactScreen.routeName,
      path: '/contact',
      pageBuilder: customPageBuilder(const ContactScreen(), movePageDirection: MovePageDirection.bottomRight),
    ),
  ],
);

Page<dynamic> Function(BuildContext, GoRouterState) customPageBuilder<T>(Widget child,
        {String? type, MovePageDirection movePageDirection = MovePageDirection.topLeft}) =>
    (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(context: context, state: state, child: child, movePageDirection: movePageDirection, type: type);
    };

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required MovePageDirection movePageDirection,
  String? type,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case 'fade':
            return FadeTransition(opacity: animation, child: child);
          case 'rotation':
            return RotationTransition(turns: animation, child: child);
          case 'size':
            return SizeTransition(sizeFactor: animation, child: child);
          case 'scale':
            return ScaleTransition(scale: animation, child: child);
          case 'cupertino':
            return CupertinoPageTransition(
                primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation, linearTransition: false, child: child);
          default:
            return MovePageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              child: child,
              direction: movePageDirection,
            );
        }
      });
}

enum MovePageDirection { topLeft, topRight, bottomLeft, bottomRight }

/// CupertinoPageTransition을 참고하여 만든 커스텀 Transition
class MovePageTransition extends StatelessWidget {
  static const Offset _topLeftOffset = Offset(-1, -1);
  static const Offset _topRightOffset = Offset(1, -1);
  static const Offset _bottomLeftOffset = Offset(-1, 1);
  static const Offset _bottomRightOffset = Offset(1, 1);

  MovePageTransition({
    super.key,
    required Animation<double> primaryRouteAnimation,
    required Animation<double> secondaryRouteAnimation,
    required MovePageDirection direction,
    required this.child,
    Curve curve = Curves.ease,
  })  : _primaryPositionAnimation = CurvedAnimation(
          parent: primaryRouteAnimation,
          curve: curve,
          reverseCurve: curve.flipped,
        ).drive(Tween<Offset>(
            begin: direction == MovePageDirection.topLeft
                ? _topLeftOffset
                : direction == MovePageDirection.topRight
                    ? _topRightOffset
                    : direction == MovePageDirection.bottomLeft
                        ? _bottomLeftOffset
                        : direction == MovePageDirection.bottomRight
                            ? _bottomRightOffset
                            : _topLeftOffset,
            end: Offset.zero)),
        _secondaryPositionAnimation = CurvedAnimation(
          parent: secondaryRouteAnimation,
          curve: curve,
          reverseCurve: curve.flipped,
        ).drive(Tween<Offset>(
            begin: Offset.zero,
            end: direction == MovePageDirection.topLeft
                ? _bottomRightOffset
                : direction == MovePageDirection.topRight
                    ? _bottomLeftOffset
                    : direction == MovePageDirection.bottomLeft
                        ? _topRightOffset
                        : direction == MovePageDirection.bottomRight
                            ? _topLeftOffset
                            : _bottomRightOffset));

  final Animation<Offset> _primaryPositionAnimation;
  final Animation<Offset> _secondaryPositionAnimation;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);
    return SlideTransition(
      position: _secondaryPositionAnimation,
      textDirection: textDirection,
      transformHitTests: false,
      child: SlideTransition(position: _primaryPositionAnimation, textDirection: textDirection, child: child),
    );
  }
}
