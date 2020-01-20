// Copyright 2020 Dmitry Kovelenov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'theme.dart';
import 'frames.dart';

class Hands extends StatefulWidget {
  Hands({this.hoursTheme, this.minutesTheme})
      : assert(hoursTheme != null),
        assert(minutesTheme != null);

  final DialTheme hoursTheme;
  final DialTheme minutesTheme;

  @override
  _HandsState createState() => _HandsState(hoursTheme, minutesTheme);
}

class _HandsState extends State<Hands> {
  _HandsState(this.hoursTheme, this.minutesTheme);

  var _now = DateTime.now();
  Timer _timer;

  DialTheme hoursTheme;
  DialTheme minutesTheme;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      _timer = Timer(
        Duration(seconds: 5 - _now.second % 5) -
            Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomPaint(
            painter: _HandsPainter(
                now: _now,
                hoursTheme: hoursTheme,
                minutesTheme: minutesTheme)));
  }
}

class _HandsPainter extends CustomPainter {
  static const double DEGREES_IN_CIRCLE = 360;
  static const double START_POINT = -math.pi / 2.0;

  _HandsPainter({
    @required this.now,
    @required this.hoursTheme,
    @required this.minutesTheme,
  })  : assert(hoursTheme != null),
        assert(minutesTheme != null),
        hoursColor = hoursTheme.colors[(now.hour / 12).floor()],
        minutesColor =
            minutesTheme.colors[now.hour % minutesTheme.colors.length],
        hoursBckColor = hoursTheme.colors[1 - (now.hour / 12).floor()],
        minutesBckColor =
            minutesTheme.colors[(now.hour - 1) % minutesTheme.colors.length],
        hoursAngleDegrees = now.hour % 12 * 30.0 + now.minute * .5,
        minutesAngleDegrees = now.minute * 6.0 + now.second * .1;

  final DateTime now;
  final DialTheme hoursTheme;
  final DialTheme minutesTheme;
  final Color hoursColor;
  final Color minutesColor;
  final Color hoursBckColor;
  final Color minutesBckColor;
  final double hoursAngleDegrees;
  final double minutesAngleDegrees;

  @override
  void paint(Canvas canvas, Size size) {
    var frames =
        Frames(size: size, hoursTheme: hoursTheme, minutesTheme: minutesTheme);

    _DrawHand(canvas, frames.hoursInnerFrame, hoursAngleDegrees, hoursColor,
        hoursBckColor);
    _DrawHand(canvas, frames.minutesInnerFrame, minutesAngleDegrees,
        minutesColor, minutesBckColor);
  }

  @override
  bool shouldRepaint(_HandsPainter oldDelegate) {
    return oldDelegate.hoursAngleDegrees != hoursAngleDegrees ||
        oldDelegate.minutesAngleDegrees != minutesAngleDegrees ||
        oldDelegate.hoursColor != hoursColor ||
        oldDelegate.minutesColor != minutesColor ||
        oldDelegate.hoursBckColor != hoursBckColor ||
        oldDelegate.minutesBckColor != minutesBckColor;
  }

  void _DrawHand(Canvas canvas, Rect frame, double angleDegrees, Color color,
      Color bckColor) {
    final arcPaint = Paint();

    canvas.drawArc(
        frame, 0, radians(DEGREES_IN_CIRCLE), true, arcPaint..color = bckColor);
    canvas.drawArc(frame, START_POINT, radians(angleDegrees), true,
        arcPaint..color = color);
  }
}
