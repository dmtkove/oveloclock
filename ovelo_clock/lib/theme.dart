// Copyright 2020 Dmitry Kovelenov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class DialTheme {
  DialTheme(
      {@required this.size,
      @required this.bezelSize,
      @required this.bezelSliceSize,
      @required this.horizontalAlign,
      @required this.verticalAlign,
      @required this.colors,
      @required this.bezelColors})
      : assert(size != null),
        assert(bezelSize != null),
        assert(bezelSliceSize != null),
        assert(horizontalAlign != null),
        assert(verticalAlign != null),
        assert(colors != null),
        assert(bezelColors != null) {
    size = _toPercent(size);
    bezelSize = _toPercent(bezelSize);
    horizontalAlign = _toPercent(horizontalAlign);
    verticalAlign = _toPercent(verticalAlign);
  }

  double size;
  double bezelSize;
  final double bezelSliceSize;
  double horizontalAlign;
  double verticalAlign;
  final List<Color> colors;
  final List<Color> bezelColors;

  double _toPercent(double percentage) => percentage / 100;
}

class ClockTheme {
  const ClockTheme(
      {@required this.backgroundColor,
      @required this.hoursTheme,
      @required this.minutesTheme})
      : assert(backgroundColor != null),
        assert(hoursTheme != null),
        assert(minutesTheme != null);

  final Color backgroundColor;
  final DialTheme hoursTheme;
  final DialTheme minutesTheme;
}
