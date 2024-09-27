import 'package:flutter/material.dart';


class RoundedFlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  final Color? foregroundColor;
  final Color backgroundColor;

  RoundedFlatButton(
      {super.key,
      required this.onPressed,
      BorderRadius? borderRadius,
      this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      required this.child,
      this.foregroundColor,
      this.backgroundColor = Colors.transparent})
      : this.borderRadius = borderRadius ?? BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return MaterialButton(

      // style: ElevatedButton.styleFrom(
      //   textStyle: TextStyle().copyWith(
      //     fontFamily: AppFontFamily.cookieRunKR,
      //     fontSize: 18,
      //
      //   ),
      //     foregroundColor: colorScheme.onPrimary,
      //     shape: RoundedRectangleBorder(borderRadius: this.borderRadius),
      //     backgroundColor: backgroundColor ?? colorScheme.primaryContainer),
      elevation: 0,
      highlightElevation: 3,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      //color: colorScheme.brightness == Brightness.light?const Color(0xFFEAEAEA):const Color(0xFF6A6A6A),
      padding: padding,
      onPressed: onPressed,
      child: child,
    );
  }
}
