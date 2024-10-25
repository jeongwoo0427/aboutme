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

  const ProjectPageWidget({Key? key, required this.projects, required this.controller, required this.onPageChanged}) : super(key: key);

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
                  child: GlassyContainer(
                      width: 250 * context.minScreenLengthRatio,
                      height: double.infinity,
                      child: Center(
                        child: Text(LanguageUtility().findDetailByLanguage(language: ref.currentLanguage, details: projects[index].details)?.title??''),
                      )));
              //return getItem(width: 250 * context.minScreenLengthRatio, height: double.infinity);
            },
            itemCount: projects.length,
          ),
        ),
      ),
    );
  }
}
