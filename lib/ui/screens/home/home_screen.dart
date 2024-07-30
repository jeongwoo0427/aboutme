import 'package:aboutme/ui/screens/home/pages/header_page.dart';
import 'package:aboutme/ui/screens/home/pages/info_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerPage(),
            InfoPage(),
          ],
        ),
      ),
    );
  }
}
