import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/widgets/scaffold/fitted_screen_size_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GreetingPage extends ConsumerWidget {
  GreetingPage({super.key, required this.showContinueText});

  final bool showContinueText;

  final List<String> _greetingTexts = [
    'Hello',
    'Bonjour',
    'Salve',
    '안녕하세요',
    '你好',
    'Hola',
    'おはよう',
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return FittedScreenSizeBody(
        body: Column(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GreetingTextArea(
            currentPosition: 1,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[0],
            fontWeightValue: 0,
          ),
          GreetingTextArea(
            currentPosition: 2,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[1],
            fontWeightValue: 3,
          ),
          GreetingTextArea(
            currentPosition: 3,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[2],
            fontWeightValue: 5,
          ),
          GreetingTextArea(
            currentPosition: 4,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[3],
            fontWeightValue: 7,
          ),
          GreetingTextArea(
            currentPosition: 5,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[4],
            fontWeightValue: 5,
          ),
          GreetingTextArea(
            currentPosition: 6,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[5],
            fontWeightValue: 3,
          ),
          GreetingTextArea(
            currentPosition: 7,
            totalCount: _greetingTexts.length,
            text: _greetingTexts[6],
            fontWeightValue: 0,
          ),
        ],
      )
          //.animate(delay: 2500.ms,onPlay: (con)=>con.repeat(reverse: true)).shimmer(color: Colors.white,duration: 1500.ms)
          ),

      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: showContinueText ? 1 : 0,
            duration: const Duration(milliseconds: 1000),
            child: Text(
              ref.localizations.introduction_screen_greeting_page_scroll_text,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: context.getResponsiveValue(20, 15),
                  color: context.colorScheme.onSurface),
            )
                .animate(
                    delay: 4000.ms,
                    onPlay: (controller) => controller.repeat(reverse: true))
                .fadeIn(duration: 1000.ms),
          ),
        ],
      )
    ]));
  }
}

class GreetingTextArea extends StatelessWidget {
  const GreetingTextArea(
      {super.key,
      required this.currentPosition,
      required this.totalCount,
      required this.fontWeightValue,
      required this.text});

  final int currentPosition;
  final int totalCount;
  final int fontWeightValue;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Spacer(
        flex: currentPosition,
      ),
      Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.values[fontWeightValue],
            fontSize: context.getResponsiveValue(45, 35),
            color: context.colorScheme.onSurface),
      )
          .animate()
          .fadeIn(delay: (currentPosition * 200 + 1000).ms, duration: 200.ms),
      Spacer(
        flex: totalCount - currentPosition + 1,
      )
    ]);
  }
}
