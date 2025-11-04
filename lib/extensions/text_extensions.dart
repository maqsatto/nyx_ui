import 'package:flutter/material.dart';

extension TextStyleExtensions on Text {
  Text textWhite() => _copyWith(color: Colors.white);
  Text textBlack() => _copyWith(color: Colors.black);
  Text textBold() => _copyWith(fontWeight: FontWeight.bold);
  Text textSemiBold() => _copyWith(fontWeight: FontWeight.w600);
  Text textLight() => _copyWith(fontWeight: FontWeight.w300);
  Text textLg() => _copyWith(fontSize: 18);
  Text textMd() => _copyWith(fontSize: 16);
  Text textSm() => _copyWith(fontSize: 14);
  Text textColor(Color color) => _copyWith(color: color);
  Text alignCenter() => _copyWith(align: TextAlign.center);
  Text alignRight() => _copyWith(align: TextAlign.right);
  Text alignLeft() => _copyWith(align: TextAlign.left);

  Text _copyWith({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextAlign? align,
  }) {
    return Text(
      data ?? '',
      textAlign: align ?? textAlign,
      style: (style ?? const TextStyle()).copyWith(
        color: color ?? style?.color,
        fontWeight: fontWeight ?? style?.fontWeight,
        fontSize: fontSize ?? style?.fontSize,
      ),
    );
  }
}