// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

import 'colors.dart';

class ShadowsSheme {
  final ColorsSheme _colorSheme;
  ShadowsSheme(this._colorSheme);
  //
  List<BoxShadow> _shadow(Color color, double x, double y, double blur,
          {double? spread}) =>
      [
        BoxShadow(
          color: color,
          offset: Offset(x, y),
          blurRadius: blur,
          spreadRadius: spread ?? 0,
        )
      ];
//
  //Primary=======================================================
  List<BoxShadow> get primarySM => _shadow(_colorSheme.grey50, 0, 2, 3);
  List<BoxShadow> get primaryDefault => _shadow(_colorSheme.grey50, 0, 8, 8);
  List<BoxShadow> get primaryLG => _shadow(_colorSheme.grey50, 0, 10, 20);
  //Secondary=====================================================
  List<BoxShadow> get secondarySM => _shadow(_colorSheme.grey60, 0, 2, 3);
  List<BoxShadow> get secondaryDefault => _shadow(_colorSheme.grey60, 0, 4, 16);
  List<BoxShadow> get secondaryLG => _shadow(_colorSheme.grey60, 0, 10, 20);
  //Grey==========================================================
  List<BoxShadow> get greySM => _shadow(Colors.black12, 0, 8, 8);
  List<BoxShadow> get greyDefault => _shadow(_colorSheme.grey50, 0, 4, 16);
  List<BoxShadow> get greyLG => _shadow(_colorSheme.grey50, 0, 10, 20);
  List<BoxShadow> get greyCard => _shadow(_colorSheme.grey50, 0, 4, 18);
  List<BoxShadow> get greyModal => _shadow(_colorSheme.grey50, 0, 5, 20);
}
