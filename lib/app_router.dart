import 'package:aboutme/ui/screens/home/home_screen.dart';
import 'package:aboutme/ui/screens/whoami/whoami_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      pageBuilder: customPageBuilder(
        const HomeScreen(),
      ),
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
      pageBuilder: customPageBuilder(const WhoAmIScreen()),
    ),
  ],
);

Page<dynamic> Function(BuildContext, GoRouterState) customPageBuilder<T>(Widget child, {String? type}) => (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(context: context, state: state, child: child, type: type);
    };

CustomTransitionPage buildPageWithDefaultTransition<T>({required BuildContext context, required GoRouterState state, required Widget child, String? type}) {
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
          case 'cupertino' :
            return CupertinoPageTransition(
                primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation, linearTransition: false, child: child);
          default:
            return MovePageTransition(primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation, child: child,);
        }
      });
}

/// CupertinoPageTransition을 참고하여 만든 커스텀 Transition
class MovePageTransition extends StatelessWidget {
  static final _rightMiddleTween = Tween<Offset>(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  );

  static final _middleLeftTween = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.0, 0.0),
  );

  MovePageTransition({
    super.key,
    required Animation<double> primaryRouteAnimation,
    required Animation<double> secondaryRouteAnimation,
    required this.child,
    Curve curve = Curves.ease,
  })  : _primaryPositionAnimation = CurvedAnimation(parent: primaryRouteAnimation, curve: curve, reverseCurve: curve).drive(_rightMiddleTween),
        _secondaryPositionAnimation = CurvedAnimation(parent: primaryRouteAnimation, curve: curve, reverseCurve: curve).drive(_middleLeftTween);

  final Animation<Offset> _primaryPositionAnimation;
  final Animation<Offset> _secondaryPositionAnimation;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _secondaryPositionAnimation,
      child: SlideTransition(
        position: _primaryPositionAnimation,
        child: child,
      ),
    );
  }
}
