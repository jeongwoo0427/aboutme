import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SkillDetailPage extends StatefulWidget {
  static const String routeName = 'SkillDetailPage';

  final Skill skill;

  const SkillDetailPage({super.key, required this.skill});

  @override
  State<SkillDetailPage> createState() => _SkillDetailPageState();
}

class _SkillDetailPageState extends State<SkillDetailPage> with SingleTickerProviderStateMixin {
  late final Animation<double> _circleContainerAnimation;
  late final AnimationController _circleContainerAnimationController;

  @override
  void initState() {
    initAnimations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SkillModel skillModel = mySkills[widget.skill]!;

    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
              child: Container(
                height: 500,
                width: 500,
                color: Colors.red,
              )),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _circleContainerAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _circleContainerAnimation.value,
                        child: Opacity(opacity: _circleContainerAnimation.value, child: child),
                      );
                    },
                    child: Container(
                      width: 180 * context.screenSizeRatio,
                      height: 180 * context.screenSizeRatio,
                      decoration: BoxDecoration(
                          border: Border.all(color: context.colorScheme.onSurface.withOpacity(0.7), width: 5 * context.screenSizeRatio),
                          borderRadius: BorderRadius.circular(2000)),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    height: 100 * context.screenSizeRatio,
                    width: 100 * context.screenSizeRatio,
                    child: Hero(
                      tag: 'SkillIconHero-${skillModel.name}',
                      child: SvgPicture.asset(
                        skillModel.iconAsset,
                        colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

  void initAnimations() {
    _circleContainerAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _circleContainerAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _circleContainerAnimationController, curve: Curves.decelerate));

    Future.delayed(const Duration(milliseconds: 700), () => {_circleContainerAnimationController.forward()});
  }
}
