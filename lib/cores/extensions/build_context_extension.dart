import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension BuildContextExtension on BuildContext{
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  T getResponsiveValue<T>(T defaultValue, T whenSmallerThanTabletValue){
    return ResponsiveValue<T>(this,defaultValue:defaultValue,conditionalValues: [
      Condition.smallerThan(name: TABLET, value: whenSmallerThanTabletValue)
    ]).value;
  }
  Size get screenSize => MediaQuery.sizeOf(this);
  double get minScreenLength => screenSize.height > screenSize.width ? screenSize.width : screenSize.height;
  double get minScreenLengthRatio => minScreenLength / 1000;
}