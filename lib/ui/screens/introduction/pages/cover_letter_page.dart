import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/fitted_screen_size_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverLetterPage extends ConsumerStatefulWidget {
  CoverLetterPage({super.key});

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
    final TextStyle profileStateTextStyle = TextStyle(
        fontSize: context.getResponsiveValue(18, 14),
        fontWeight: FontWeight.w300,
        color: context.colorScheme.onSurface);

    final TextStyle doubleQuotationTextStyle = TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: context.getResponsiveValue(55, 44),
        color: context.colorScheme.onSurface.withOpacity(0.5));

    final TextStyle letterTextStyle = TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: context.getResponsiveValue(16, 12),
        color: context.colorScheme.onSurface);

    return FittedScreenSizeBody(
      body: Padding(
        padding: EdgeInsets.all(context.getResponsiveValue(70, 30)),
        child: Center(
          child: MaxWidthBox(
            child: GlassyContainer(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaxWidthBox(
                    maxWidth: 700,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          minRadius: context.getResponsiveValue(60, 45),
                          backgroundColor: Colors.white24,
                        ),
                        DefaultTextStyle(
                          style: profileStateTextStyle,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name : Kim Jeong Woo'),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Age : 26'),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Job : Flutter software developer'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '“',
                    style: doubleQuotationTextStyle,
                  ),
                  MaxWidthBox(
                    maxWidth: 700,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: ref.localizations
                              .introduction_screen_letter_page_letter,
                          style: letterTextStyle)
                    ]),textAlign: TextAlign.center,),
                  ),
                  Text(
                    '”',
                    style: doubleQuotationTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
