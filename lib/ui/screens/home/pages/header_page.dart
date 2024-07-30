import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenSize.height,
      color: context.colorScheme.primary,
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue<double>(context, defaultValue: 35, conditionalValues: [
        Condition.smallerThan(name: TABLET, value: 0),
      ]).value),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
        Text('asdfaksdjf;lasjdf;lajsl;kdfj;lasdfj;lasjkf')
      ],),
    );
  }
}
