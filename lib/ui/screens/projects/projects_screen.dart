import 'dart:ui';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  static const routeName = 'ProjectsScreen';

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _pageLoadAnimController;
  late final Animation _pageLoadAnim;

  late final AnimationController _pageToBottomAnimController;
  late final Animation _pageToBottomAnim;

  late final AnimationController _projectDetailAnimController;
  late final Animation _projectDetailAnim;

  final PageController _pageController =
      PageController(viewportFraction: 0.3, initialPage: 9);

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
    _initAnimations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      isTranparentAppbar: true,
      appbarTitle: Text('Projects'),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                  child: AnimatedBuilder(
                animation: _projectDetailAnim,
                builder: (_, __) {
                  return Opacity(
                      opacity: _projectDetailAnim.value,
                      child: ProjectDetailView());
                },
              ))),
          AnimatedBuilder(
            animation: _pageToBottomAnim,
            builder: (context, child) {
              return AnimatedBuilder(
                animation: _pageLoadAnim,
                builder: (_, __) {
                  return Positioned(
                    left: (-context.screenSize.width / 2) * _pageLoadAnim.value,
                    right: (context.screenSize.width / 2) * _pageLoadAnim.value,
                    top: context.screenSize.height /
                        1.4 *
                        _pageToBottomAnim.value,
                    bottom: 0,
                    child: Center(
                      child: SizedBox(
                        height: 120 * context.minScreenLengthRatio,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(
                              dragDevices: {
                                PointerDeviceKind.touch,
                                PointerDeviceKind.mouse
                              }),
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: _onPageChanged,
                            itemBuilder: (context, index) {
                              return Center(
                                child: GlassyContainer(
                                  width: 250 * context.minScreenLengthRatio,
                                  height: double.infinity,
                                  child: const Center(child: Text('hi')),
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
    _pageLoadAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _pageLoadAnim =
        Tween<double>(begin: 1, end: 0).animate(_pageLoadAnimController);

    _pageToBottomAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _pageToBottomAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _pageToBottomAnimController, curve: Curves.ease));

    _projectDetailAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _projectDetailAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _projectDetailAnimController, curve: Curves.ease));

    await Future.delayed(const Duration(milliseconds: 300));

    await _pageLoadAnimController.forward();
    await _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 2300), curve: Curves.decelerate);
    await _pageToBottomAnimController.forward();
    await _projectDetailAnimController.forward();

    _isAnimationLoadComplete = true;
  }
}

class ProjectDetailView extends ConsumerWidget {
  const ProjectDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPotrait = MediaQuery.of(context).size.width < 1000;

    final Widget imageBox = MaxSizedBox(
      maxWidth: 600,
      child: Center(
        child: AspectRatio(
            aspectRatio: 5 / 3,
            child: GlassyContainer(
              child: Text(''),
            )),
      ),
    );

    final Widget detailBox = MaxSizedBox(
      maxWidth: 500,
      maxHeight: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Expanded(
              flex: 3,
              child: Text(
                'hihiih',
                style: TextStyle(
                    fontSize: isPotrait ? 28 : 33, fontWeight: FontWeight.w700,),
              )),
          Expanded(
            flex: 8,
            child: Text(
              'yayayayayayay',
              style: TextStyle(
                  fontSize: isPotrait ?15:17, fontWeight: FontWeight.w300),
            ),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 2,
            child: Row(children: [
              Text(
                '프로젝트 기간: ',
                style: TextStyle(
                    fontSize: isPotrait ?15:17, fontWeight: FontWeight.w900),
              ),
              Text(
                '23.09 ~ 23.11',
                style: TextStyle(
                    fontSize: isPotrait ?15:17, fontWeight: FontWeight.w500),
              ),
            ],),
          ),
          Expanded(
            flex: 3,
            child:Row(children: [
              Text(
                '사용스택: ',
                style: TextStyle(
                    fontSize: isPotrait ?15:17, fontWeight: FontWeight.w900),
              ),
              Icon(Icons.gamepad)
            ],)
          ),

        ],
      ),
    );

    if (isPotrait) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 3,
          ),
          Expanded(
              flex: 5,
              child: Padding(padding: EdgeInsets.all(15), child: imageBox)),
          Expanded(
              flex: 7,
              child: Padding(padding: EdgeInsets.all(15), child: detailBox)),
          Spacer(
            flex: 4,
          )
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 4,
          ),
          Expanded(flex: 6, child: imageBox),
          Spacer(flex: 1),
          Expanded(flex: 8, child: detailBox),
          Spacer(
            flex: 1,
          ),
        ],
      );
    }
  }
}
