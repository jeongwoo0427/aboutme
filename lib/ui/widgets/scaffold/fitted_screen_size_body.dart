import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class FittedScreenSizeBody extends StatelessWidget {

  const FittedScreenSizeBody({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenSize.height,
      width: context.screenSize.width,
      padding: const EdgeInsets.only(top: 80, bottom: 14),
      child: body,
    );
  }
}
