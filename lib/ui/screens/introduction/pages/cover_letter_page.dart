import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/scaffold/fitted_screen_size_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverLetterPage extends ConsumerStatefulWidget {
  const CoverLetterPage({super.key});

  @override
  ConsumerState<CoverLetterPage> createState() => _CoverLetterPageState();
}

class _CoverLetterPageState extends ConsumerState<CoverLetterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle letterTextStyle = TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: context.getResponsiveValue(18, 14),
        color: context.colorScheme.onSurface.withOpacity(0.8));

    return FittedScreenSizeBody(
      body: Padding(
        padding: EdgeInsets.all(context.getResponsiveValue(70, 30)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text(
            //   '“',
            //   style: doubleQuotationTextStyle,
            // ),
            MaxSizedBox(
              maxWidth: 800,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: ref.localizations.introduction_screen_letter_page_letter, style: letterTextStyle)
                ]),
                textAlign: TextAlign.center,
              ),
            ),

            // Text(
            //   '”',
            //   style: doubleQuotationTextStyle,
            // ),
          ],
        ),
      ),
    );
  }
}
