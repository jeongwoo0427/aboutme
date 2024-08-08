import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late final GifController _gifController;

  @override
  void initState() {
    //_gifController = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.screenSize.height,
        color: Colors.black,
        child: Center(
          child: Image.asset(AppAssets.BG_EARTH_ANIM),
        //     child: Gif(
        //   image: const AssetImage(AppAssets.BG_EARTH_ANIM),
        //   controller: _gifController,
        //   autostart: Autostart.loop,
        //   fps: 30,
        //   duration: const Duration(seconds: 3),
        //   placeholder: (context) => const Text('Loading ...'),
        //   onFetchCompleted: () {
        //     _gifController.reset();
        //     _gifController.forward();
        //   },
        // ),
        ),
      ),
    );
  }
}
