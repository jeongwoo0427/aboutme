import 'package:aboutme/constants/app_constants.dart';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/states/providers/current_language_provider.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';

import 'package:aboutme/ui/widgets/glassy_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GlassyAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool isTransparentBackground;

  const GlassyAppbar(
      {Key? key, this.title, this.isTransparentBackground = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguageNotifier = ref.read(currentLanguageProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GlassyContainer(
        blur: isTransparentBackground ? 0 : 5,
        borderOpacity: isTransparentBackground ? 0 : 0.6,
        height: 60,
        //기본높이 60
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_left,
                    color: context.colorScheme.onSurface,
                  ),
                  iconSize: context.getResponsiveValue<double>(35, 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: context.getResponsiveValue<double>(20, 16),
                        fontWeight: FontWeight.w700,
                        color: context.colorScheme.onSurface),
                    child: title ?? Text('')),
              ),
            ),
            Positioned(
              right: 5,
              top: 0,
              bottom: 0,
              child: Center(
                child: GlassyDropdownButton(
                  textStyle: TextStyle(
                      fontSize: context.getResponsiveValue(14, 11),
                      fontWeight: FontWeight.w500),
                  width: context.getResponsiveValue(100, 80),
                  height: context.getResponsiveValue(45, 40),
                  onChanged: (item) =>
                      currentLanguageNotifier.changeLanguage(item.value),
                  initValue: currentLanguageNotifier.currentLanguage,
                  items: [
                    GlassyDropdownButtonItem(
                        value: LanguageCode.ko, text: 'Korean'),
                    GlassyDropdownButtonItem(
                        value: LanguageCode.en, text: 'English'),
                    GlassyDropdownButtonItem(
                        value: LanguageCode.jp, text: 'Japan'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 20); //총합 높이 80
}
