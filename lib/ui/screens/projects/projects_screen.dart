import 'dart:ui';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/screens/projects/project_details_widget.dart';
import 'package:aboutme/ui/screens/projects/project_page_widget.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  static const routeName = 'ProjectsScreen';

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with TickerProviderStateMixin {
  late final AnimationController _progressHideAnimController;
  late final Animation _progressHideAnim;

  late final AnimationController _pageLoadAnimController;
  late final Animation _pageLoadAnim;

  late final AnimationController _pageToBottomAnimController;
  late final Animation _pageToBottomAnim;

  late final AnimationController _projectDetailAnimController;
  late final Animation _projectDetailAnim;

  final PageController _pageController = PageController(viewportFraction: 0.3, initialPage: 9);

  bool _isAnimationLoadComplete = false;

  @override
  void dispose() {
    _pageLoadAnimController.dispose();
    _pageToBottomAnimController.dispose();
    _projectDetailAnimController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initAsync();

    super.initState();
  }

  Future<void> initAsync() async {
    await _initAnimations();
    await Future.delayed(Duration(milliseconds: 2000));
    await _startAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      isTranparentAppbar: true,
      appbarTitle: Text('Projects'),
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: AnimatedBuilder(
                animation: _progressHideAnim,
                builder: (_, __) {
                  return Transform.scale(scale: _progressHideAnim.value, child: LoadingAnimationWidget.fourRotatingDots(color: Colors.white, size: 50));
                },
              ),
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                  child: AnimatedBuilder(
                animation: _projectDetailAnim,
                builder: (_, __) {
                  return Opacity(opacity: _projectDetailAnim.value, child: ProjectDetailsWidget());
                },
              ))),
          AnimatedBuilder(
            animation: _pageToBottomAnim,
            builder: (context, child) {
              return AnimatedBuilder(
                animation: _pageLoadAnim,
                builder: (_, __) {
                  return Positioned(
                    left: (-context.screenSize.width / 1.5) * _pageLoadAnim.value,
                    right: (context.screenSize.width / 1.5) * _pageLoadAnim.value,
                    top: context.screenSize.height / 1.4 * _pageToBottomAnim.value,
                    bottom: 0,
                    child: ProjectPageWidget(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
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

  Future<void> _onPageChanged(int value) async {
    if (_isAnimationLoadComplete) {
      await _projectDetailAnimController.reverse();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    if (_isAnimationLoadComplete) {
      await Future.delayed(const Duration(milliseconds: 100));
      await _projectDetailAnimController.forward();
    }
  }

  Future<void> _initAnimations() async {
    _progressHideAnimController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _progressHideAnim = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: _progressHideAnimController, curve: Curves.decelerate));

    _pageLoadAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _pageLoadAnim = Tween<double>(begin: 1, end: 0).animate(_pageLoadAnimController);

    _pageToBottomAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _pageToBottomAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _pageToBottomAnimController, curve: Curves.ease));

    _projectDetailAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _projectDetailAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _projectDetailAnimController, curve: Curves.ease));
  }

  Future<void> _startAnimations() async {
    await _progressHideAnimController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    await _pageLoadAnimController.forward();
    await _pageController.animateToPage(0, duration: const Duration(milliseconds: 2300), curve: Curves.decelerate);
    await _pageToBottomAnimController.forward();
    await _projectDetailAnimController.forward();

    _isAnimationLoadComplete = true;
  }
}
