import 'package:flutter/widgets.dart';

extension PaddingExtensions on Widget {
  Widget p(double value) => _padding(all: value);
  Widget px(double value) => _padding(horizontal: value);
  Widget py(double value) => _padding(vertical: value);
  Widget pt(double value) => _padding(top: value);
  Widget pb(double value) => _padding(bottom: value);
  Widget pl(double value) => _padding(left: value);
  Widget pr(double value) => _padding(right: value);

  Widget _padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    if (this is Padding) {
      final current = ((this as Padding).padding as EdgeInsets?) ??
          const EdgeInsets.all(0);

      return Padding(
        padding: EdgeInsets.only(
          top: top ?? vertical ?? all ?? current.top,
          bottom: bottom ?? vertical ?? all ?? current.bottom,
          left: left ?? horizontal ?? all ?? current.left,
          right: right ?? horizontal ?? all ?? current.right,
        ),
        child: (this as Padding).child!,
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }
}
