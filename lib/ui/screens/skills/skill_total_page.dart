import 'dart:math';

import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:aboutme/ui/screens/skills/widgets/circle_border_conatainer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillTotalPage extends StatefulWidget {
  const SkillTotalPage({Key? key}) : super(key: key);

  @override
  State<SkillTotalPage> createState() => _SkillTotalPageState();
}

class _SkillTotalPageState extends State<SkillTotalPage> with SingleTickerProviderStateMixin {
  late final AnimationController _circleAnimationController;
  late final Animation<double> _circleAnimation;
  final int _skillAnimationDelay = 3500;

  @override
  void initState() {
    _initAnimations();
    super.initState();
  }

  void _initAnimations() {
    _circleAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _circleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _circleAnimationController, curve: Curves.easeInOutCubic));

    Future.delayed(const Duration(milliseconds: 1000), () {
      _circleAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.sizeOf(context);
    //폭, 너비 중 작을 것을 기준으로 사이즈를 적용
    final double minScreenLength = screenSize.height > screenSize.width ? screenSize.width : screenSize.height;
    //print(minScreenLength);
    final double holderSize = minScreenLength / 1.15;
    final double iconSize = minScreenLength / 15;

    final int widgetCount = 30;
    final List<Widget> skills = [];

    final double r = (holderSize)/2; //반지름
    final double interval = r/widgetCount;


    for(int i = 0; i<=widgetCount; i++){
      final xPosition = interval*i;
      final yPosition = sqrt((pow(r,2))-(pow(xPosition,2)));
      skills.add(
        Positioned(
          left: xPosition,
          bottom: yPosition,
          child: _SkillIconButton(
            animateMs: 0,
            skill: Skill.nodejs,
            size: iconSize/2,
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        width: holderSize,
        height: holderSize,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(holderSize/15),
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
            ),
            Positioned.fill(
              child: _SkillIconButton(
                animateDurMs: 1500,
                animateMs: _skillAnimationDelay + 3500,
                skill: Skill.flutter,
                size: iconSize * 1.7,
              ),
            ),
            ...skills

          ],
        ),
      ),
    );
  }
}

class _SkillIconButton extends StatelessWidget {
  final int animateDurMs;
  final int animateMs;
  final Skill skill;
  final double size;

  const _SkillIconButton({super.key, this.animateDurMs = 700, required this.animateMs, required this.skill, this.size = 70});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final SkillModel skillModel = mySkills[skill]!;
    return GestureDetector(
      onTap: () {
        print('onTap : ${skillModel.skill}');
      },
      child: Center(
        child: SizedBox(
          height: size,
          width: size,
          child: SvgPicture.asset(
            skillModel.iconAsset,
            colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
          ),
        ),
      ).animate(
          delay: Duration(milliseconds: animateMs),
          autoPlay: true,
          effects: [ScaleEffect(duration: Duration(milliseconds: animateDurMs), curve: Curves.elasticOut)]),
    );
  }
}
