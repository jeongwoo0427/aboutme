import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  GlassyContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.backgroundColorOpacity = 0.9,
    this.color = Colors.black,
    this.borderOpacity=0.6,
    this.borderRadius,
    this.padding,
    this.duration,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final double backgroundColorOpacity;
  final Color color;
  final double borderOpacity;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: color.withOpacity(backgroundColorOpacity),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            border: Border.all(width: 1.4, color: Colors.white.withOpacity(borderOpacity))),
        child: child,
      ),
    );
  }
}
