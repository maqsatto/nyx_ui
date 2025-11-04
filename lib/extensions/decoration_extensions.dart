import 'package:flutter/material.dart';

extension DecorationExtensions on Widget {
  Widget bg(Color color) => Container(color: color, child: this);

  Widget rounded(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );
}
