import 'package:flutter/widgets.dart';

extension MarginExtensions on Widget {
  Widget m(double value) => _margin(all: value);
  Widget mx(double value) => _margin(horizontal: value);
  Widget my(double value) => _margin(vertical: value);
  Widget mt(double value) => _margin(top: value);
  Widget mb(double value) => _margin(bottom: value);
  Widget ml(double value) => _margin(left: value);
  Widget mr(double value) => _margin(right: value);

  Widget _margin({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    if (this is Container) {
      final c = this as Container;
      final current = (c.margin as EdgeInsets?) ?? const EdgeInsets.all(0);

      // Извлекаем ширину и высоту из constraints, если есть
      double? width;
      double? height;
      final constraints = c.constraints;
      if (constraints != null) {
        width = constraints.hasBoundedWidth ? constraints.maxWidth : null;
        height = constraints.hasBoundedHeight ? constraints.maxHeight : null;
      }

      return Container(
        margin: EdgeInsets.only(
          top: top ?? vertical ?? all ?? current.top,
          bottom: bottom ?? vertical ?? all ?? current.bottom,
          left: left ?? horizontal ?? all ?? current.left,
          right: right ?? horizontal ?? all ?? current.right,
        ),
        decoration: c.decoration,
        padding: c.padding,
        alignment: c.alignment,
        constraints: constraints,
        width: width,
        height: height,
        child: c.child,
      );
    }

    return Container(
      margin: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }
}
