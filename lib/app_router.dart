import 'package:aboutme/ui/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/screens/splash_screen.dart';

// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: customPageBuilder(const SplashScreen()),
      routes: <RouteBase>[
        GoRoute(
          name: HomeScreen.routeName,
          path: 'home',
          pageBuilder: customPageBuilder(HomeScreen()),
        ),
        // GoRoute(
        //   name: ManageQuizScreen.routeName,
        //   path: 'create-quiz',
        //   pageBuilder: customPageBuilder(
        //     const ManageQuizScreen(
        //       manageMode: ManageMode.create,
        //     ),
        //   ),
        // ),
      ],
    ),
  ],
);

Page<dynamic> Function(BuildContext, GoRouterState) customPageBuilder<T>(
        Widget child,
        {String? type}) =>
    (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
          context: context, state: state, child: child, type: type);
    };

CustomTransitionPage buildPageWithDefaultTransition<T>(
    {required BuildContext context,
    required GoRouterState state,
    required Widget child,
    String? type}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
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
          case 'slide':
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(0, 1), end: Offset.zero).chain(
                  CurveTween(
                    curve: Curves.ease,
                  ),
                ),
              ),
              child: child,
            );
          default:
            return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                linearTransition: false,
                child: child);
        }
      });
}
