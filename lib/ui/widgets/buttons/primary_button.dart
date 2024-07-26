import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  final Color? foregroundColor;
  final Color? backgroundColor;

  PrimaryButton(
      {super.key,
      required this.onPressed,
      BorderRadius? borderRadius,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      required this.child,
      this.foregroundColor,
      this.backgroundColor})
      : this.borderRadius = borderRadius ?? BorderRadius.circular(32);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle().copyWith(
          fontSize: 18,
        ),
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: this.borderRadius),
          backgroundColor: backgroundColor ?? colorScheme.primaryContainer),
      onPressed: onPressed,
      child: Padding(padding: padding, child: child),
    );
  }
}
