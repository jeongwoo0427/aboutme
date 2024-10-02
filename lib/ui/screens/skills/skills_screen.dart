import 'package:aboutme/ui/screens/skills/skill_detail_page.dart';
import 'package:aboutme/ui/screens/skills/skill_total_page.dart';
import 'package:flutter/material.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  static const routeName = 'SkillsScreen';

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
        appbarTitle: const Text('Skills'),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [SkillTotalPage()],
        ));
  }
}
