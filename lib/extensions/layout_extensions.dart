import 'package:flutter/material.dart';

extension LayoutExtensions on Widget {
  Widget center() => Center(child: this);
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);
  Widget alignTL() => Align(alignment: Alignment.topLeft, child: this);
  Widget alignTR() => Align(alignment: Alignment.topRight, child: this);
  Widget alignBL() => Align(alignment: Alignment.bottomLeft, child: this);
  Widget alignBR() => Align(alignment: Alignment.bottomRight, child: this);
  Widget alignCL() => Align(alignment: Alignment.centerLeft, child: this);
  Widget alignCR() => Align(alignment: Alignment.centerRight, child: this);
  Widget flex({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);
}
/// Утилиты для Row / Column
extension FlexContainerExtensions on Widget {
  /// Делает Column из списка виджетов
  static Widget column({
    List<Widget> children = const [],
    MainAxisAlignment mainAxis = MainAxisAlignment.start,
    CrossAxisAlignment crossAxis = CrossAxisAlignment.center,
  }) {
    return Column(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: children,
    );
  }

  /// Делает Row из списка виджетов
  static Widget row({
    List<Widget> children = const [],
    MainAxisAlignment mainAxis = MainAxisAlignment.start,
    CrossAxisAlignment crossAxis = CrossAxisAlignment.center,
  }) {
    return Row(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: children,
    );
  }

  /// Делает Wrap для автоматического переноса элементов
  static Widget wrap({
    List<Widget> children = const [],
    double spacing = 8,
    double runSpacing = 8,
  }) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: children,
    );
  }
}

/// Утилиты выравнивания в Flex-контейнерах
extension FlexAlignmentExtensions on Widget {
  Widget spaceBetween() => _wrapFlex(mainAxisAlignment: MainAxisAlignment.spaceBetween);

  Widget spaceAround() => _wrapFlex(mainAxisAlignment: MainAxisAlignment.spaceAround);

  Widget spaceEvenly() => _wrapFlex(mainAxisAlignment: MainAxisAlignment.spaceEvenly);

  Widget alignStart() => _wrapFlex(mainAxisAlignment: MainAxisAlignment.start);

  Widget alignCenter() => _wrapFlex(mainAxisAlignment: MainAxisAlignment.center);

  Widget alignEnd() => _wrapFlex(mainAxisAlignment: MainAxisAlignment.end);

  Widget _wrapFlex({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    if (this is Row) {
      final row = this as Row;
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: row.crossAxisAlignment,
        children: row.children,
      );
    } else if (this is Column) {
      final col = this as Column;
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: col.crossAxisAlignment,
        children: col.children,
      );
    }
    return this;
  }
}
