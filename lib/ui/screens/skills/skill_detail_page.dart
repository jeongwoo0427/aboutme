import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SkillDetailPage extends StatefulWidget {
  final SkillModel skillModel;

  const SkillDetailPage({Key? key, required this.skillModel}) : super(key: key);

  @override
  State<SkillDetailPage> createState() => _SkillDetailPageState();
}

class _SkillDetailPageState extends State<SkillDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child:  Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: SvgPicture.asset(
          widget.skillModel.iconAsset,
          colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
        ),
      ),
    ),);
  }
}
