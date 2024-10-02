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
    final circleSize = minScreenLength / 1.15;
    final iconSize = minScreenLength / 15;

    return Center(
      child: Container(
        width: circleSize,
        height: circleSize,
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
              child: _SkillIconButton(
                animateDurMs: 1500,
                animateMs: _skillAnimationDelay+3500,
                skill: Skill.flutter,
                size: iconSize *1.7,
              ),
            ),
            Positioned.fill(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10, childAspectRatio: 1),
                  children: [
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay,
                      skill: Skill.nodejs,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+1000,
                      skill: Skill.mariadb,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+1500,
                      skill: Skill.nestjs,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
      
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2000,
                      skill: Skill.linux,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2200,
                      skill: Skill.nginx,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2400,
                      skill: Skill.dotnet,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2500,
                      skill: Skill.androidstudio,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2600,
                      skill: Skill.vscode,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2700,
                      skill: Skill.github,
                      size: iconSize,
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    _SkillIconButton(
                      animateMs: _skillAnimationDelay+2800,
                      skill: Skill.socketio,
                      size: iconSize,
                    ),
                  ],
                ))
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
      onTap: (){
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
      ).animate(delay: Duration(milliseconds: animateMs),autoPlay: true, effects: [
        ScaleEffect(duration: Duration(milliseconds: animateDurMs),curve: Curves.elasticOut)
      ]),
    );
  }
}
