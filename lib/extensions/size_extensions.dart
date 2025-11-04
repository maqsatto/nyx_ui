import 'package:flutter/material.dart';

extension SizeExtensions on Widget {
  Widget w(double width) => SizedBox(width: width, child: this);
  Widget h(double height) => SizedBox(height: height, child: this);
  Widget wh(double width, double height) => SizedBox(width: width, height: height, child: this);  
  Widget maxh() => SizedBox(height: double.infinity, child: this);  
  Widget maxw() => SizedBox(width: double.infinity, child: this);  
}