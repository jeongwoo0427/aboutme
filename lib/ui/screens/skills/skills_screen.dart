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
              page = SkillDetailPage(skill: settings.arguments as Skill,);
            }

            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 700),
              reverseTransitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context,animation, secondaryAnimation){
                return page;
              },
              transitionsBuilder: (context,animation,secondaryAnimation,child){
                final TextDirection textDirection = Directionality.of(context);

                Curve curve = Curves.ease;

                final Animation<Offset> _primaryPositionAnimation= CurvedAnimation(
                  parent: animation,
                  curve: curve,
                  reverseCurve: curve.flipped,
                ).drive(Tween<Offset>(
                    begin: const Offset(1,0),
                    end: Offset.zero));

                final Animation<Offset> _secondaryPositionAnimation = CurvedAnimation(
                  parent: secondaryAnimation,
                  curve: curve,
                  reverseCurve: curve.flipped,
                ).drive(Tween<Offset>(
                    begin: Offset.zero,
                    end:  Offset(-1, 0)));

                return SlideTransition(
                  position: _secondaryPositionAnimation,
                  textDirection: textDirection,
                  transformHitTests: false,
                  child: SlideTransition(position: _primaryPositionAnimation, textDirection: textDirection, child: child),
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
    _navigatorKey.currentState!.pushNamed(SkillDetailPage.routeName,arguments: skill);
  }
}
