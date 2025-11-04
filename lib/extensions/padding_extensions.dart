import 'package:flutter/widgets.dart';

extension PaddingExtensions on Widget {
  Widget p(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget px(double value) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Widget py(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );
}
