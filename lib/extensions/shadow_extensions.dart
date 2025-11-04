import 'package:flutter/material.dart';

extension ShadowExtensions on Widget {
  Widget shadowSm({Color color = Colors.black26}) =>
      _withShadow(color, blur: 4, offset: const Offset(0, 1), spread: 0);
  Widget shadowMd({Color color = Colors.black26}) =>
      _withShadow(color, blur: 8, offset: const Offset(0, 3), spread: 0);
  Widget shadowLg({Color color = Colors.black26}) =>
      _withShadow(color, blur: 16, offset: const Offset(0, 6), spread: -2);
  Widget shadowXl({Color color = Colors.black26}) =>
      _withShadow(color, blur: 32, offset: const Offset(0, 12), spread: -4);
  Widget shadowNone() => _withShadow(Colors.transparent, blur: 0, offset: Offset.zero, spread: 0);

  Widget _withShadow(Color color, {double blur = 8, Offset offset = Offset.zero, double spread = 0}) {
    if (this is Container) {
      final c = this as Container;
      final existing = c.decoration as BoxDecoration?;

      final mergedShadows = [
        if (existing?.boxShadow != null) ...existing!.boxShadow!,
        BoxShadow(color: color, blurRadius: blur, offset: offset, spreadRadius: spread),
      ];

      return Container(
        margin: c.margin,
        padding: c.padding,
        alignment: c.alignment,
        constraints: c.constraints,
        decoration: BoxDecoration(
          color: existing?.color,
          border: existing?.border,
          borderRadius: existing?.borderRadius,
          boxShadow: mergedShadows,
        ),
        child: c.child,
      );
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: color, blurRadius: blur, offset: offset, spreadRadius: spread),
        ],
      ),
      child: this,
    );
  }
}
