import 'package:aboutme/constants/app_assets.dart';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/screens/skills/widgets/circle_border_conatainer_widget.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  static const routeName = 'SkillsScreen';

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _circleAnimationController;
  late final Animation<double> _circleAnimation;

  @override
  void initState() {
    _initAnimations();
    super.initState();
  }

  void _initAnimations() {
    _circleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _circleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _circleAnimationController, curve: Curves.easeInOutCubic));

    Future.delayed(const Duration(milliseconds: 1000), () {
      _circleAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    //폭, 너비 중 작을 것을 기준으로 사이즈를 적용
    final minScreenLength = screenSize.height > screenSize.width
        ? screenSize.width
        : screenSize.height;
    //print(minScreenLength);

    return ResponsiveGlassyScaffold(
        appbarTitle: Text('Skills'),
        body: Center(
          child: Container(
            width: minScreenLength / 1.15,
            height: minScreenLength / 1.15,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _circleAnimation,
                    builder: (context, child) {
                      return CircleBorderContainerWidget(
                        progress: _circleAnimation.value,
                        color: colorScheme.onSurface.withOpacity(0.8),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: Stack(
                    children: [
                      Positioned.fill(child: _SkillIconButton()),
                      //Positioned(top: 120, left: 160, child: _SkillIconButton()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _SkillIconButton extends StatelessWidget {
  const _SkillIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: SizedBox(
        height: 70,
        width: 70,
        child: SvgPicture.asset(
          AppAssets.SVG_FLUTTER,
          colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
        ),
      ),
    );
  }
}
