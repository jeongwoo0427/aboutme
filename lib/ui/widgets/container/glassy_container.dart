import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  const GlassyContainer(
      {Key? key, required this.child, this.width, this.height, this.blur = 30, this.opacity = 0.1, this.color = Colors.black, this.borderRadius})
      : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final double blur;
  final double opacity;
  final Color color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            border: Border.all(width: 1.4,color: Colors.white.withOpacity(0.6))
          ),
          child: child,
        ),
      ),
    );
  }
}
