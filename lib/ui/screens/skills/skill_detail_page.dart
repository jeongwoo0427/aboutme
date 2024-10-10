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

class _SkillDetailPageState extends State<SkillDetailPage> {
  @override
  Widget build(BuildContext context) {
    final SkillModel skillModel = mySkills[widget.skill]!;
    return Container(
      child:  Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Hero(
          tag: 'SkillIconHero-${skillModel.name}',
          child: Material(
            child: SvgPicture.asset(
              skillModel.iconAsset,
              colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    ),);
  }
}
