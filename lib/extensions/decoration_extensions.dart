import 'package:flutter/material.dart';

extension DecorationExtensions on Widget {
  Widget bg(Color color) => _decorated(bg: color);

  Widget rounded(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  Widget border({
    Color color = Colors.black,
    double width = 1,
    double radius = 0,
  }) =>
      _decorated(border: Border.all(color: color, width: width), radius: radius);

  Widget _decorated({Color? bg, BoxBorder? border, double radius = 0}) {
    if (this is Container) {
      final c = this as Container;
      final existing = c.decoration as BoxDecoration?;
      final newDecoration = BoxDecoration(
        color: bg ?? existing?.color,
        border: border ?? existing?.border,
        borderRadius: existing?.borderRadius ?? BorderRadius.circular(radius),
      );
      return Container(
        decoration: newDecoration,
        child: c.child,
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: bg,
        border: border,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: this,
    );
  }
}