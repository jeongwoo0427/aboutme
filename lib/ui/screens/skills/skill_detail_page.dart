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

class _SkillDetailPageState extends ConsumerState<SkillDetailPage> with TickerProviderStateMixin {
  late final Animation<double> _showInfoAnimation;
  late final AnimationController _showInfoAnimationController;

  Future<Map<String, dynamic>>? _futureSkillDescriptions;

  @override
  void dispose() {
    _showInfoAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _futureSkillDescriptions = getSkillDescriptions();
    initAnimations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getResponsiveValue(false, true);
    final SkillModel skillModel = mySkills[widget.skill]!;
    final double sizeRatio = context.minScreenLengthRatio;
    final DateTime skillStartedAt = DateTime.parse(skillModel.startedAt);

    return AnimatedBuilder(
      animation: _showInfoAnimation,
      builder: (context, child) {
        final double value = _showInfoAnimation.value;
        return Stack(
          children: [
            Positioned(
              left: isMobile ? 0 : 0 + value * 250 * sizeRatio,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                  child: MaxSizedBox(
                maxWidth: context.getResponsiveValue(400, 550),
                maxHeight: 600,
                child: Opacity(
                  opacity: isMobile ? 1 : value,
                  child: GlassyContainer(
                    width: (isMobile ? 700 : 500) * sizeRatio,
                    height: (isMobile ? 1000 : 800) * sizeRatio,
                    padding: EdgeInsets.all(context.getResponsiveValue(25, 15)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            spacing: 15,
                            children: [
                              if (isMobile)
                                SizedBox(
                                  height: 80 * sizeRatio,
                                  width: 80 * sizeRatio,
                                  child: Hero(
                                    tag: 'SkillIconHero-${skillModel.name}',
                                    child: SvgPicture.asset(
                                      skillModel.iconAsset,
                                      colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                              Center(
                                child: Text(
                                  skillModel.name,
                                  style: TextStyle(
                                      fontSize: context.getResponsiveValue(32, 26), fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 5,
                            child: FutureBuilder<Map<String, dynamic>>(
                              future: _futureSkillDescriptions,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data?[languageCodes[ref.currentLanguage]]?[skillModel.code] ?? 'UNKNOWN',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: context.getResponsiveValue(18, 16), fontWeight: FontWeight.w300),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Started at ${skillStartedAt.year}. ${skillStartedAt.month}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: context.getResponsiveValue(23, 16), fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              )),
            ),
            if (!isMobile)
              Positioned(
                left: 0,
                right: 0 + value * 550 * sizeRatio,
                top: 0,
                bottom: 0,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: SizedBox(
                          height: 80 * sizeRatio,
                          width: 80 * sizeRatio,
                          child: Hero(
                            tag: 'SkillIconHero-${skillModel.name}',
                            child: SvgPicture.asset(
                              skillModel.iconAsset,
                              colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
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
    _showInfoAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _showInfoAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _showInfoAnimationController, curve: Curves.decelerate));

    Future.delayed(const Duration(milliseconds: 800), () => {_showInfoAnimationController.forward()});
  }

  Future<Map<String, dynamic>> getSkillDescriptions() async {
    final jsonString = await rootBundle.loadString(AppAssets.JSON_SKILL_DETAILS);
    final descriptions = jsonDecode(jsonString);
    return descriptions;
  }
}
