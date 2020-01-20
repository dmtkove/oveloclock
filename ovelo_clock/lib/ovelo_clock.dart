// Copyright 2020 Dmitry Kovelenov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'dials.dart';
import 'hands.dart';
import 'theme.dart';
import 'themes.dart';

class OveloClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ClockTheme clockTheme;

    if (Theme.of(context).brightness == Brightness.light) {
      clockTheme = CoaxialMulticColor;
    } else {
      clockTheme = CoaxialGrayScale;
    }

    return Semantics.fromProperties(
        properties: SemanticsProperties(label: 'Ovelo clock'),
        child: Container(
            color: clockTheme.backgroundColor,
            child: CustomPaint(
              painter: DialsPainter(
                  hoursTheme: clockTheme.hoursTheme,
                  minutesTheme: clockTheme.minutesTheme),
              child: Hands(
                  hoursTheme: clockTheme.hoursTheme,
                  minutesTheme: clockTheme.minutesTheme),
            )));
  }
}
