import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension BuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  T getResponsiveValue<T>(T defaultValue, T whenSmallerThanTabletValue) {
    return ResponsiveValue<T>(this,
        defaultValue: defaultValue,
        conditionalValues: [Condition.smallerThan(name: TABLET, value: whenSmallerThanTabletValue)]).value;
  }

  bool get isMobile => getResponsiveValue(false, true);
  Size get screenSize => MediaQuery.sizeOf(this);
  //가로 세로 중 더 작은 사이즈를 반환
  double get minScreenLength => screenSize.height > screenSize.width ? screenSize.width : screenSize.height;
  double get minScreenLengthRatio => minScreenLength / 1000;
}
