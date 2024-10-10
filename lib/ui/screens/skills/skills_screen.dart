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

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Skill? skill = ref.watch(selectedSkillProvider);

    return ResponsiveGlassyScaffold(
      onPressedBack: ()=> _onPressedBack(context),
      appbarTitle: const Text('Skills'),
      isTranparentAppbar: true,
      body: HeroControllerScope(
        controller: MaterialApp.createMaterialHeroController(),
        child: Navigator(
          key: _navigatorKey,
          initialRoute: SkillTotalPage.routeName,
          onGenerateRoute: (settings) {
            late Widget page;
            if (settings.name == SkillTotalPage.routeName) {
              page = SkillTotalPage(onClickSkill: _onClickSkill,);
            } else if (settings.name == SkillDetailPage.routeName) {
              page = SkillDetailPage(skill: Skill.nestjs,);
            }

            return PageRouteBuilder(
              pageBuilder: (context,animation, secondaryAnimation){
                return page;
              },
              transitionsBuilder: (context,animation,secondaryAnimation,child){
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              settings: settings
            );

          },
        ),
      )
    );
  }


  void _onPressedBack(BuildContext context) {
    if(_navigatorKey.currentState!.canPop()){
      _navigatorKey.currentState!.pop();
    }else{
      Navigator.pop(context);
    }
  }

  _onClickSkill(Skill skill) {
    _navigatorKey.currentState!.pushNamed(SkillDetailPage.routeName);
  }
}
