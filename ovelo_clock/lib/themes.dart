// Copyright 2020 Dmitry Kovelenov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'theme.dart';

// Themes include layout features in them so will affect
// the actual way the clock looks apart from its colors.

// Themes for landscape usage.

final BlackAndWhite = ClockTheme(
    backgroundColor: Color(0xFF000000),
    hoursTheme: DialTheme(
        size: 90,
        bezelSize: 8,
        bezelSliceSize: 30,
        horizontalAlign: 35,
        verticalAlign: 0,
        colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
        bezelColors: [Color(0xFF000000), Color(0xFFFFFFFF)]),
    minutesTheme: DialTheme(
        size: 40,
        bezelSize: 15,
        bezelSliceSize: 6,
        horizontalAlign: -7,
        verticalAlign: -21,
        colors: [Color(0xFF000000), Color(0xFFFFFFFF)],
        bezelColors: [Color(0xFFFFFFFF), Color(0xFF000000)]));

final GrayScale = ClockTheme(
    backgroundColor: Color(0xFF000000),
    hoursTheme: DialTheme(
        size: 80,
        bezelSize: 10,
        bezelSliceSize: 30,
        horizontalAlign: 5,
        verticalAlign: 0,
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF000000)
        ],
        bezelColors: [
          Color(0xFF121212),
          Color(0xFF242424),
          Color(0xFF363636),
          Color(0xFF484848),
          Color(0xFF5A5A5A),
          Color(0xFF6C6C6C),
          Color(0xFF7E7E7E),
          Color(0xFF909090),
          Color(0xFFA2A2A2),
          Color(0xFFB4B4B4),
          Color(0xFFC6C6C6),
          Color(0xFFD8D8d8)
        ]),
    minutesTheme: DialTheme(
        size: 80,
        bezelSize: 10,
        bezelSliceSize: 30,
        horizontalAlign: -5,
        verticalAlign: 0,
        colors: [
          Color(0xFF000000),
          Color(0xFFFFFFFF)
        ],
        bezelColors: [
          Color(0xFFD8D8d8),
          Color(0xFFC6C6C6),
          Color(0xFFB4B4B4),
          Color(0xFFA2A2A2),
          Color(0xFF909090),
          Color(0xFF7E7E7E),
          Color(0xFF6C6C6C),
          Color(0xFF5A5A5A),
          Color(0xFF484848),
          Color(0xFF363636),
          Color(0xFF242424),
          Color(0xFF121212)
        ]));

// The black and white inner bezel of the clock will point at the position of the hours hand,
// the colorful arc at the position of the minutes hand, however each color is layed out throughout
// the outer bezel separating the hours thus making the colorful arc indicate the hour by its increasing color.
final CoaxialMulticColor = ClockTheme(
    backgroundColor: Color(0xFFFFFFFF),
    hoursTheme: DialTheme(
        size: 100,
        bezelSize: 12,
        bezelSliceSize: 30,
        horizontalAlign: 50,
        verticalAlign: 0,
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF000000)
        ],
        bezelColors: [
          Color(0xFFffff99),
          Color(0xFF99ccff),
          Color(0xFFccff99),
          Color(0xFFcc99ff),
          Color(0xFF99ff99),
          Color(0xFFff99ff),
          Color(0xFF99ffcc),
          Color(0xFFff99cc),
          Color(0xFF99ffff),
          Color(0xFFff9999),
          Color(0xFF80d4ff),
          Color(0xFFffcc99)
        ]),
    minutesTheme: DialTheme(
        size: 80,
        bezelSize: 0,
        bezelSliceSize: 30,
        horizontalAlign: -50,
        verticalAlign: 0,
        colors: [
          Color(0xFFffff99),
          Color(0xFF99ccff),
          Color(0xFFccff99),
          Color(0xFFcc99ff),
          Color(0xFF99ff99),
          Color(0xFFff99ff),
          Color(0xFF99ffcc),
          Color(0xFFff99cc),
          Color(0xFF99ffff),
          Color(0xFFff9999),
          Color(0xFF80d4ff),
          Color(0xFFffcc99)
        ],
        bezelColors: [
          Color(0xFF000000)
        ]));

final CoaxialGrayScale = ClockTheme(
    backgroundColor: Color(0xFFFFFFFF),
    hoursTheme: DialTheme(
        size: 100,
        bezelSize: 12,
        bezelSliceSize: 30,
        horizontalAlign: 50,
        verticalAlign: 0,
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFFFF1111)
        ],
        bezelColors: [
          Color(0xFF121212),
          Color(0xFF7E7E7E),
          Color(0xFF242424),
          Color(0xFF909090),
          Color(0xFF363636),
          Color(0xFFA2A2A2),
          Color(0xFF484848),
          Color(0xFFB4B4B4),
          Color(0xFF5A5A5A),
          Color(0xFFC6C6C6),
          Color(0xFF6C6C6C),
          Color(0xFFD8D8d8)
        ]),
    minutesTheme: DialTheme(
        size: 85,
        bezelSize: 0,
        bezelSliceSize: 30,
        horizontalAlign: -50,
        verticalAlign: 0,
        colors: [
          Color(0xFF121212),
          Color(0xFF7E7E7E),
          Color(0xFF242424),
          Color(0xFF909090),
          Color(0xFF363636),
          Color(0xFFA2A2A2),
          Color(0xFF484848),
          Color(0xFFB4B4B4),
          Color(0xFF5A5A5A),
          Color(0xFFC6C6C6),
          Color(0xFF6C6C6C),
          Color(0xFFD8D8d8)
        ],
        bezelColors: [
          Color(0xFF000000)
        ]));
