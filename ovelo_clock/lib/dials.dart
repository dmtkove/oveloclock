// Copyright 2020 Dmitry Kovelenov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'theme.dart';
import 'frames.dart';

class DialsPainter extends CustomPainter {
  static const double DEGREES_IN_CIRCLE = 360;
  static const double START_POINT = -math.pi / 2.0;

  DialsPainter({@required this.hoursTheme, @required this.minutesTheme})
      : assert(hoursTheme != null),
        assert(minutesTheme != null),
        assert(hoursTheme.bezelSliceSize > 0),
        assert(hoursTheme.bezelSliceSize <= DEGREES_IN_CIRCLE),
        assert(DEGREES_IN_CIRCLE % hoursTheme.bezelSliceSize == 0),
        //hoursTheme can only have exactly two colors
        assert(hoursTheme.colors.length == 2),
        assert(minutesTheme.bezelSliceSize > 0),
        assert(minutesTheme.bezelSliceSize <= DEGREES_IN_CIRCLE),
        assert(DEGREES_IN_CIRCLE % minutesTheme.bezelSliceSize == 0);

  final DialTheme hoursTheme;
  final DialTheme minutesTheme;

  @override
  void paint(Canvas canvas, Size size) {
    var frames =
        Frames(size: size, hoursTheme: hoursTheme, minutesTheme: minutesTheme);

    _paintDial(
        canvas, hoursTheme, frames.hoursOuterFrame, frames.hoursInnerFrame);
    _paintDial(canvas, minutesTheme, frames.minutesOuterFrame,
        frames.minutesInnerFrame);
  }

  @override
  bool shouldRepaint(DialsPainter oldDelegate) => false;

  void _paintDial(
      Canvas canvas, DialTheme dialTheme, Rect outerFrame, Rect innerFrame) {
    final arcPaint = Paint();
    final sweepAngle = radians(dialTheme.bezelSliceSize);

    for (var i = 0; i < DEGREES_IN_CIRCLE / dialTheme.bezelSliceSize; i++)
      canvas.drawArc(
          outerFrame,
          i * sweepAngle + START_POINT,
          sweepAngle,
          true,
          arcPaint
            ..color = dialTheme.bezelColors[i % dialTheme.bezelColors.length]);
  }
}
