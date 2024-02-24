import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

class IntEncoder extends ThemeEncoder<int> {
  const IntEncoder();

  @override
  int lerp(int a, int b, double t) {
    return lerpDouble(a, b, t)!.toInt();
  }
}

class DoubleEncoder extends ThemeEncoder<double> {
  const DoubleEncoder();

  @override
  double lerp(double a, double b, double t) {
    return lerpDouble(a, b, t)!;
  }
}

class EdgeInsetsEncoder extends ThemeEncoder<EdgeInsets> {
  const EdgeInsetsEncoder();

  @override
  EdgeInsets lerp(EdgeInsets a, EdgeInsets b, double t) {
    return EdgeInsets.lerp(a, b, t)!;
  }
}
