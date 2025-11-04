import 'package:flutter/material.dart';

extension TextStyleExtensions on Text {
  Text textWhite() => _copyWith(color: Colors.white);
  Text textBold() => _copyWith(fontWeight: FontWeight.bold);
  Text textLg() => _copyWith(fontSize: 18);

  Text _copyWith({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return Text(
      data ?? '',
      style: (style ?? const TextStyle()).copyWith(
        color: color ?? style?.color,
        fontWeight: fontWeight ?? style?.fontWeight,
        fontSize: fontSize ?? style?.fontSize,
      ),
    );
  }
}
