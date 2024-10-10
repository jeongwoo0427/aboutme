import 'package:aboutme/ui/screens/skills/skill_detail_page.dart';
import 'package:aboutme/ui/screens/skills/skill_model.dart';
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
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      onPressedBack: _onPressedBack,
      appbarTitle: const Text('Skills'),
      isTranparentAppbar: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SkillTotalPage(
            onClickSkill: _onClickSkill,
          ),
          SkillDetailPage(
            skillModel: mySkills[Skill.flutter]!,
          )
        ],
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _previousPage() {
    _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onClickSkill(SkillModel skillModel) {
    _nextPage();
  }

  void _onPressedBack() {
    if (_pageController.page == 0) {
      Navigator.pop(context);
    } else {
      _previousPage();
    }
  }
}
