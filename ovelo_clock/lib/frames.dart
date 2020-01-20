// Copyright 2020 Dmitry Kovelenov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'theme.dart';

class Frames {
  Rect hoursOuterFrame;
  Rect hoursInnerFrame;
  Rect minutesOuterFrame;
  Rect minutesInnerFrame;

  static Frames _frames;

  factory Frames(
          {@required Size size,
          @required DialTheme hoursTheme,
          @required DialTheme minutesTheme}) =>
      _frames ??
      Frames._internal(
          size: size, hoursTheme: hoursTheme, minutesTheme: minutesTheme);

  Frames._internal({Size size, DialTheme hoursTheme, DialTheme minutesTheme}) {
    Size halfSize;
    Offset hoursCenter;
    Offset minutesCenter;

    var halfLongSide = size.longestSide / 2;
    var halfShortSide = size.shortestSide / 2;
    var hoursCenterD = size.longestSide * .25;
    var minutesCenterD = size.longestSide * .75;

    // Despite the fact that ratio is intended to be 5:3 the calculation would
    // adjust to any ratio and mode including portrait.
    if (size.width > size.height) {
      halfSize = Size(halfLongSide, size.height);
      hoursCenter = Offset(
          hoursCenterD + halfLongSide * hoursTheme.horizontalAlign,
          halfShortSide + size.height * hoursTheme.verticalAlign);
      minutesCenter = Offset(
          minutesCenterD + halfLongSide * minutesTheme.horizontalAlign,
          halfShortSide + size.height * minutesTheme.verticalAlign);
    } else {
      halfSize = Size(size.width, halfLongSide);
      hoursCenter = Offset(
          halfShortSide + size.width * hoursTheme.horizontalAlign,
          hoursCenterD + halfLongSide * hoursTheme.verticalAlign);
      minutesCenter = Offset(
          halfShortSide + size.width * minutesTheme.horizontalAlign,
          minutesCenterD + halfLongSide * minutesTheme.verticalAlign);
    }

    hoursOuterFrame = _GetRect(halfSize, hoursCenter, hoursTheme.size);
    hoursInnerFrame = _GetRect(
        halfSize, hoursCenter, hoursTheme.size * (1 - hoursTheme.bezelSize));
    minutesOuterFrame = _GetRect(halfSize, minutesCenter, minutesTheme.size);
    minutesInnerFrame = _GetRect(halfSize, minutesCenter,
        minutesTheme.size * (1 - minutesTheme.bezelSize));
  }

  static Rect _GetRect(Size size, Offset center, double multiplier) {
    var side = size.shortestSide * multiplier;

    return Rect.fromCenter(center: center, width: side, height: side);
  }
}
