import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: context.screenSize.height,
      width: context.screenSize.width,

    );
  }
}
