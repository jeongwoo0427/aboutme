import 'dart:math';

import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:aboutme/ui/screens/skills/widgets/circle_border_conatainer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillTotalPage extends StatefulWidget {
  static const String routeName = 'SkillTotalPage';

  final Function(Skill skill) onClickSkill;

  const SkillTotalPage({super.key, required this.onClickSkill});

  @override
  State<SkillTotalPage> createState() => _SkillTotalPageState();
}

class _SkillTotalPageState extends State<SkillTotalPage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _circleAnimationController;
  late final Animation<double> _circleAnimation;
  final int _skillAnimationDelay = 2300;
  final List<SkillModel> skills = mySkills.values.toList()..removeWhere((element) => element.skill == Skill.flutter,);

  @override
  void initState() {
    _initAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _circleAnimationController.dispose();
    super.dispose();
  }

  void _initAnimations() {
    _circleAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1300));
    _circleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _circleAnimationController, curve: Curves.easeInOutCubic));

    Future.delayed(const Duration(milliseconds: 1000), () {
      _circleAnimationController.forward();
    });
  }

  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.sizeOf(context);
    //폭, 너비 중 작을 것을 기준으로 사이즈를 적용
    final double minScreenLength = screenSize.height > screenSize.width ? screenSize.width : screenSize.height;
    //print(minScreenLength);
    final double holderSize = minScreenLength / 1.15;
    final double iconSize = minScreenLength / 15;



    final double r = (holderSize) / 2; //반지름이자 거리
    final double distance = r/1.5;
    final double degreeInterval = 360/skills.length;

    final List<Widget> skillWidgets = [];
    final Offset centerOffset = Offset(holderSize/2 - (iconSize/2),holderSize/2 - (iconSize/2));

    for(int i =0; i<skills.length; i++){
      final double degree = i * degreeInterval + 90; //12시 방향에서 시작하기 위해 90도 더함
      final Offset position = _getPosition(degree: degree , distance: distance);
      final SkillModel skill = skills[i];
      skillWidgets.add(
        Positioned(
          left: position.dx + centerOffset.dx,
          bottom: position.dy + centerOffset.dy,
          child: _SkillIconButton(
            animateMs: _skillAnimationDelay+i*120,
            skill: skill.skill,
            size: iconSize,
            onClickSkill: widget.onClickSkill,
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
                padding: EdgeInsets.all(holderSize / 15),
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
                animateDurMs: 1000,
                animateMs: _skillAnimationDelay + 1700,
                skill: Skill.flutter,
                size: iconSize * 1.7,
                onClickSkill: widget.onClickSkill,
              ),
            ),
            ...skillWidgets
          ],
        ),
      ),
    );
  }

  //각도와 거리에 따른 x,y 좌표값 구하기
  //degree가 커질수록  3시 방향에서 반시계 방향으로 위치가 결정됨
  Offset _getPosition({required double degree, required double distance}) {
    final double radian = degree * (pi / 180); //각도를 라디안 단위로 변경
    final double dx = distance * cos(radian);
    final double dy = distance * sin(radian);
    return Offset(dx, dy);
  }


  @override
  bool get wantKeepAlive => true;
}



class _SkillIconButton extends StatelessWidget {
  final int animateDurMs;
  final int animateMs;
  final Skill skill;
  final double size;
  final Function(Skill skill) onClickSkill;

  const _SkillIconButton({this.animateDurMs = 700, required this.animateMs, required this.skill, this.size = 70, required this.onClickSkill});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final SkillModel skillModel = mySkills[skill]!;
    return GestureDetector(
      onTap: () {
        onClickSkill(skill);
      },
      child: Center(
        child: SizedBox(
          height: size,
          width: size,
          child: Hero(
            tag: 'SkillIconHero-${skillModel.name}',
            child: SvgPicture.asset(
              skillModel.iconAsset,
              colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
            ),
          ),
        ),
      ).animate(
          delay: Duration(milliseconds: animateMs),
          autoPlay: true,
          effects: [ScaleEffect(duration: Duration(milliseconds: animateDurMs), curve: Curves.elasticOut)]),
    );
  }
}
