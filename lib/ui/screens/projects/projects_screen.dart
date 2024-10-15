import 'dart:math';
import 'dart:ui';

import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  static const routeName = 'ProjectsScreen';

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.2);

  @override
  Widget build(BuildContext context) {

    return ResponsiveGlassyScaffold(
      isTranparentAppbar: false,
      appbarTitle: Text('Projects'),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
        child: PageView.builder(
          physics: PageScrollPhysics(),
          controller: _pageController,
          itemBuilder: (context, index) {
            return getItem(width: context.screenSize.width/10, height: context.screenSize.width/10);
          },
          itemCount: 10,

        ),
      ),
    );
  }

  getItem({double width = 200, double height = 200}) {
    return Center(
        child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: Colors.red),
    ));
  }
}
