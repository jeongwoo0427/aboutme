import 'package:flutter/material.dart';

class FloatingCardContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double elevation;
  final double borderRadius;
  final EdgeInsets padding;
  final Color? color;

  const FloatingCardContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.elevation = 4.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        color: color ?? colorScheme.surface,
      ),
      child: Padding(
        padding: padding,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
