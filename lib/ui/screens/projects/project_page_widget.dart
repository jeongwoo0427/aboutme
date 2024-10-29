import 'dart:ui';

import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_get.dro.dart';
import 'package:aboutme/cores/utils/language_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/container/glassy_container.dart';

class ProjectPageWidget extends ConsumerWidget {
  final List<ProjectGetDro> projects;
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final Function(int) onTapItem;

  const ProjectPageWidget({Key? key, required this.projects, required this.controller, required this.onPageChanged, required this.onTapItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        height: 120 * context.minScreenLengthRatio,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: PageView.builder(
            controller: controller,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Center(
                  child: GestureDetector(
                    onTap: (){
                      onTapItem(index);
                    },
                    child: GlassyContainer(
                        width: 270 * context.minScreenLengthRatio,
                        height: double.infinity,
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Text(
                            LanguageUtility().findDetailByLanguage(language: ref.currentLanguage, details: projects[index].details)?.title ?? '',
                            style: TextStyle(fontSize: context.getResponsiveValue(18, 12), fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ));
              //return getItem(width: 250 * context.minScreenLengthRatio, height: double.infinity);
            },
            itemCount: projects.length,
          ),
        ),
      ),
    );
  }
}
