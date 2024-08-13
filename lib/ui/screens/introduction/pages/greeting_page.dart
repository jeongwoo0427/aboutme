import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GreetingPage extends StatefulWidget {
  GreetingPage({Key? key}) : super(key: key);

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> with SingleTickerProviderStateMixin {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenSize.height,
        width: context.screenSize.width,
        padding: const EdgeInsets.only(top: 80, bottom: 14),
        child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [

          
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
            fontWeightValue: 8,
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
          Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '아래로 스크롤해주세요.',
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: context.getResponsiveValue(20, 15), color: context.colorScheme.onSurface),
            ),
          ]).animate(delay: 4000.ms, onPlay: (controller) => controller.repeat(reverse: true)).fadeIn(duration: 1000.ms)
        ]));
  }
}

class GreetingTextArea extends StatelessWidget {
  const GreetingTextArea({Key? key, required this.currentPosition, required this.totalCount, required this.fontWeightValue, required this.text})
      : super(key: key);

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
        style: TextStyle(fontWeight: FontWeight.values[fontWeightValue], fontSize: context.getResponsiveValue(45, 35), color: context.colorScheme.onSurface),
      ).animate(delay: 1000.ms).fadeIn(delay: (currentPosition*200).ms,duration: 200.ms),
      Spacer(
        flex: totalCount - currentPosition + 1,
      )
    ]);
  }
}
