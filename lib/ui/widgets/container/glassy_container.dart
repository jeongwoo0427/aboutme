import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  GlassyContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.blur = 30,
    this.backgroundColorOpacity = 0.1,
    this.blurAnimateMs = 3500,
    this.color = Colors.black,
    this.borderOpacity=0.6,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final double blur;
  final int blurAnimateMs;
  final double backgroundColorOpacity;
  final Color color;
  final double borderOpacity;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              color: color.withOpacity(backgroundColorOpacity),
              borderRadius: borderRadius ?? BorderRadius.circular(20),
              border: Border.all(width: 1.4, color: Colors.white.withOpacity(borderOpacity))),
          child: child,
        ),
      ),
    );
  }
}
