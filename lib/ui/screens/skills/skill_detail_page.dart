import 'dart:convert';

import 'package:aboutme/constants/app_assets.dart';
import 'package:aboutme/constants/app_constants.dart';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SkillDetailPage extends ConsumerStatefulWidget {
  static const String routeName = 'SkillDetailPage';

  final Skill skill;

  const SkillDetailPage({super.key, required this.skill});

  @override
  ConsumerState<SkillDetailPage> createState() => _SkillDetailPageState();
}

class _SkillDetailPageState extends ConsumerState<SkillDetailPage>
    with TickerProviderStateMixin {
  late final Animation<double> _circleContainerAnimation;
  late final AnimationController _circleContainerAnimationController;

  late final Animation<double> _showInfoAnimation;
  late final AnimationController _showInfoAnimationController;

  Future<Map<String,dynamic>>? _futureSkillDescriptions;

  @override
  void dispose() {
    _circleContainerAnimationController.dispose();
    _showInfoAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    _futureSkillDescriptions = getSkillDescriptions();
    initAnimations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SkillModel skillModel = mySkills[widget.skill]!;
    final double sizeRatio = context.screenSizeRatio;

    return AnimatedBuilder(
      animation: _showInfoAnimation,
      builder: (context, child) {
        final double value = _showInfoAnimation.value;
        return Stack(
          children: [
            Positioned(
              left: 0 + value * 250 * sizeRatio,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                  child: MaxSizedBox(
                maxWidth: 400,
                maxHeight: 600,
                child: Opacity(
                  opacity: value,
                  child: GlassyContainer(
                    width: 500 * sizeRatio,
                    height: 800 * sizeRatio,
                    padding: EdgeInsets.all(context.getResponsiveValue(25, 15)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                skillModel.name,
                                style: TextStyle(
                                    fontSize:
                                        context.getResponsiveValue(38, 24),
                                    fontWeight: FontWeight.w700),
                              ),
                            )),

                        Expanded(
                            flex: 5,
                            child: FutureBuilder<Map<String,dynamic>>(
                              future: _futureSkillDescriptions,
                              builder: (context,snapshot){
                              if(snapshot.hasData){
                                return Text(
                                  snapshot.data?[languageCodes[ref.currentLanguage]]?[skillModel.code] ?? 'UNKNOWN',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize:
                                      context.getResponsiveValue(20, 14),
                                      fontWeight: FontWeight.w300),
                                );
                              }else{
                                return Container();
                              }
                            },)),
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Started at 23. 02. 09',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize:
                                      context.getResponsiveValue(23, 16),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              )),
            ),
            Positioned(
              left: 0,
              right: 0 + value * 550 * sizeRatio,
              top: 0,
              bottom: 0,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _circleContainerAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _circleContainerAnimation.value,
                            child: Opacity(
                                opacity: _circleContainerAnimation.value,
                                child: child),
                          );
                        },
                        child: Container(
                          width: 150 * sizeRatio,
                          height: 150 * sizeRatio,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.colorScheme.onSurface
                                      .withOpacity(0.8),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(2000)),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: SizedBox(
                        height: 80 * sizeRatio,
                        width: 80 * sizeRatio,
                        child: Hero(
                          tag: 'SkillIconHero-${skillModel.name}',
                          child: SvgPicture.asset(
                            skillModel.iconAsset,
                            colorFilter: ColorFilter.mode(
                                context.colorScheme.onSurface, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void initAnimations() {
    _circleContainerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _circleContainerAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _circleContainerAnimationController,
            curve: Curves.decelerate));

    _showInfoAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _showInfoAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _showInfoAnimationController, curve: Curves.decelerate));

    Future.delayed(const Duration(milliseconds: 600),
        () => {_circleContainerAnimationController.forward()});
    Future.delayed(const Duration(milliseconds: 1600),
        () => {_showInfoAnimationController.forward()});
  }

  Future<Map<String,dynamic>> getSkillDescriptions()async {
    final jsonString = await rootBundle.loadString(AppAssets.JSON_SKILL_DETAILS);
    final descriptions = jsonDecode(jsonString);
    return descriptions;
  }
}
