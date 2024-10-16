import 'dart:ui';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  static const routeName = 'ProjectsScreen';

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with TickerProviderStateMixin {
  late final AnimationController _pageLoadAnimController;
  late final Animation _pageLoadAnim;

  late final AnimationController _pageToBottomAnimController;
  late final Animation _pageToBottomAnim;

  final PageController _pageController = PageController(viewportFraction: 0.3, initialPage: 9);

  @override
  void dispose() {
    _pageLoadAnimController.dispose();
    _pageToBottomAnimController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _initAnimations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      isTranparentAppbar: false,
      appbarTitle: Text('Projects'),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _pageToBottomAnim,
            builder: (context, child) {
              return AnimatedBuilder(
                animation: _pageLoadAnim,
                builder: (_, __) {
                  return Positioned(
                    left: (-context.screenSize.width / 2) * _pageLoadAnim.value,
                    right: (context.screenSize.width / 2) * _pageLoadAnim.value,
                    top: context.screenSize.height / 1.5 * _pageToBottomAnim.value,
                    bottom: 0,
                    child: Center(
                      child: SizedBox(
                        height: 150 * context.minScreenLengthRatio,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
                          child: PageView.builder(
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              return Center(
                                child: GlassyContainer(
                                  width: 250 * context.minScreenLengthRatio,
                                  height: double.infinity,
                                  child: Text('hi'),
                                ),
                              );
                              //return getItem(width: 250 * context.minScreenLengthRatio, height: double.infinity);
                            },
                            itemCount: 10,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> _initAnimations() async {
    _pageLoadAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _pageLoadAnim = Tween<double>(begin: 1, end: 0).animate(_pageLoadAnimController);

    _pageToBottomAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _pageToBottomAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _pageToBottomAnimController, curve: Curves.ease));

    await Future.delayed(const Duration(milliseconds: 300));

    await _pageLoadAnimController.forward();
    await _pageController.animateToPage(0, duration: const Duration(milliseconds: 3000), curve: Curves.decelerate);
    await _pageToBottomAnimController.forward();
  }
}
