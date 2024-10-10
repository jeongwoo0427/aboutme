import 'package:aboutme/ui/screens/skills/skill_detail_page.dart';
import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:aboutme/ui/screens/skills/skill_total_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../cores/states/providers/selected_skill_provider.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class SkillsScreen extends ConsumerWidget {
  SkillsScreen({super.key});

  static const routeName = 'SkillsScreen';

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Skill? skill = ref.watch(selectedSkillProvider);
    return ResponsiveGlassyScaffold(
      onPressedBack: ()=> _onPressedBack(context),
      appbarTitle: const Text('Skills'),
      isTranparentAppbar: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SkillTotalPage(
            onClickSkill: (skill){
              ref.read(selectedSkillProvider.notifier).changeSkill(skill);
              _nextPage();
            },
          ),
          SkillDetailPage(
            skill: skill??Skill.flutter,
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


  void _onPressedBack(BuildContext context) {
    if (_pageController.page == 0) {
      Navigator.pop(context);
    } else {
      _previousPage();
    }
  }
}
