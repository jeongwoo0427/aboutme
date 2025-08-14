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
          behavior: scrollconfiguration.of(context).copywith(dragdevices: {pointerdevicekind.touch, pointerdevicekind.mouse}),
          child: pageview.builder(
            controller: controller,
            onpagechanged: onpagechanged,
            itembuilder: (context, index) {
              return center(
                  child: gesturedetector(
                    ontap: (){
                      ontapitem(index);
                    },
                    child: glassycontainer(
                        width: 270 * context.minscreenlengthratio,
                        height: double.infinity,
                        borderradius: borderradius.circular(10),
                        child: center(
                          child: text(
                            languageutility().finddetailbylanguage(language: ref.currentlanguage, details: projects[index].details)?.title ?? '',
                            style: textstyle(fontsize: context.getresponsivevalue(18, 12), fontweight: fontweight.w700),
                            textalign: textalign.center,
                          ),
                        )),
                  ));
              //return getitem(width: 250 * context.minscreenlengthratio, height: double.infinity);
            },
            itemcount: projects.length,
          ),
        ),
      ),
    );
  }
}
