import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassyContainer extends StatefulWidget {
  GlassyContainer(
      {Key? key, required this.child, this.width, this.height, this.isAnimateBlur=false, this.blur = 30, this.opacity = 0.1, this.color = Colors.black, this.borderRadius})
      : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final bool isAnimateBlur;
  final double blur;
  final double opacity;
  final Color color;
  final BorderRadius? borderRadius;

  @override
  State<GlassyContainer> createState() => _GlassyContainerState();
}

class _GlassyContainerState extends State<GlassyContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
      child: TweenAnimationBuilder(
        //curve: Curves.decelerate,
        tween: Tween<double>(begin: widget.isAnimateBlur?0:widget.blur, end: widget.blur),
        duration: const Duration(milliseconds: 3500),
        builder: (_, value, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
            child: child,
          );
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: widget.color.withOpacity(widget.opacity),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
              border: Border.all(width: 1.4, color: Colors.white.withOpacity(0.6))),
          child: widget.child,
        ),
      ),
    );
  }
}
