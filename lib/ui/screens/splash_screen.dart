import 'package:aboutme/ui/screens/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkRoute();
  }

  Future<void> _checkRoute() async {
    await Future.delayed(Duration(milliseconds: 1200));
    context.goNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Text(
          'About Me',
          style: TextStyle(
              fontSize: 42,
              color: colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(height: 40, width: 40, child: CircularProgressIndicator())
      ],
    ));
  }
}
