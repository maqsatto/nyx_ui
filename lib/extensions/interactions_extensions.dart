import 'package:flutter/material.dart';

extension InteractionExtensions on Widget {
  /// Обычный клик / тап
  Widget onTap(VoidCallback onTap, {bool opaque = true}) {
    return GestureDetector(
      onTap: onTap,
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      child: this,
    );
  }

  /// Обработка долгого нажатия
  Widget onLongPress(VoidCallback onLongPress, {bool opaque = true}) {
    return GestureDetector(
      onLongPress: onLongPress,
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      child: this,
    );
  }

  /// Ховер (например, для веба / десктопа)
  Widget onHover(ValueChanged<bool> onHover) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: this,
    );
  }

  /// Комбинированный обработчик
  Widget interact({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
  }) {
    return MouseRegion(
      onEnter: (_) => onHover?.call(true),
      onExit: (_) => onHover?.call(false),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        behavior: HitTestBehavior.opaque,
        child: this,
      ),
    );
  }

  /// Ховер-анимация: изменение фона, масштаба и тени
  Widget hoverEffect({
    Color? hoverBg,
    double hoverScale = 1.02,
    List<BoxShadow>? hoverShadow,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.easeOut,
  }) {
    return _HoverEffect(
      child: this,
      hoverBg: hoverBg,
      hoverScale: hoverScale,
      hoverShadow: hoverShadow,
      duration: duration,
      curve: curve,
    );
  }
}

/// Внутренний StatefulWidget, обрабатывающий hover-анимацию
class _HoverEffect extends StatefulWidget {
  final Widget child;
  final Color? hoverBg;
  final double hoverScale;
  final List<BoxShadow>? hoverShadow;
  final Duration duration;
  final Curve curve;

  const _HoverEffect({
    required this.child,
    this.hoverBg,
    this.hoverScale = 1.02,
    this.hoverShadow,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOut,
  });

  @override
  State<_HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<_HoverEffect> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: widget.curve,
        transform: Matrix4.identity()
          ..scale(hovered ? widget.hoverScale : 1.0),
        decoration: BoxDecoration(
          color: hovered ? widget.hoverBg : null,
          boxShadow: hovered ? widget.hoverShadow : null,
        ),
        child: widget.child,
      ),
    );
  }
}
