import 'package:flutter/material.dart';
import '../../../shared/shared_colors.dart';
import '../../../shared/shared_styles.dart';
import 'action_button_view_model.dart';

/// tokens visuais
class ActionButtonVisuals {
  final EdgeInsets padding;
  final double radius;
  final double iconSize;
  final TextStyle textStyle;
  final Color background;
  final Color foreground;
  final BorderSide? borderSide;
  final double elevation;

  const ActionButtonVisuals({
    required this.padding,
    required this.radius,
    required this.iconSize,
    required this.textStyle,
    required this.background,
    required this.foreground,
    this.borderSide,
    required this.elevation,
  });
}

/// tokens/tables de decisão
class ActionButtonStyles {
  //por tamanho
  static const _padLarge  = EdgeInsets.symmetric(horizontal: 38, vertical: 16);
  static const _padMedium = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  static const _padSmall  = EdgeInsets.symmetric(horizontal: 18, vertical: 10);

  static const _radiusLarge  = 20.0;
  static const _radiusMedium = 18.0;
  static const _radiusSmall  = 16.0;

  static const _iconLarge  = 28.0;
  static const _iconMedium = 24.0;
  static const _iconSmall  = 18.0;

  static TextStyle _textFor(ActionButtonSize size) {
    switch (size) {
      case ActionButtonSize.large:  return button1Bold;      // 16 Bold
      case ActionButtonSize.medium: return button2Semibold;  // 14 Bold
      case ActionButtonSize.small:  return button2Semibold;  // 12 Bold
    }
  }

  static (EdgeInsets, double, double) _metricsFor(ActionButtonSize size) {
    switch (size) {
      case ActionButtonSize.large:  return (_padLarge,  _radiusLarge,  _iconLarge);
      case ActionButtonSize.medium: return (_padMedium, _radiusMedium, _iconMedium);
      case ActionButtonSize.small:  return (_padSmall,  _radiusSmall,  _iconSmall);
    }
  }

  //tamanho+estilo
  // primary   > azul médio com texto branco (botão principal)
  // secondary > azul claro com texto azul escuro (botão secundário)
  // tertiary  > transparente com borda dourada e texto dourado (botão outlined)

  static ActionButtonVisuals of({
    required ActionButtonSize size,
    required ActionButtonStyle style,
  }) {
    final (pad, radius, icon) = _metricsFor(size);
    final text = _textFor(size);

    switch (style) {
      case ActionButtonStyle.primary:
        return ActionButtonVisuals(
          padding: pad,
          radius: radius,
          iconSize: icon,
          textStyle: text,
          background: azulEscuro,
          foreground: brancoPadrao,
          borderSide: null,
          elevation: 4,
        );

      case ActionButtonStyle.secondary:
        return ActionButtonVisuals(
          padding: pad,
          radius: radius,
          iconSize: icon,
          textStyle: text,
          background: azulClaro,
          foreground: azulEscuro,
          borderSide: null,
          elevation: 0,
        );

      case ActionButtonStyle.tertiary:
        return ActionButtonVisuals(
          padding: pad,
          radius: radius,
          iconSize: icon,
          textStyle: text,
          background: marromClaro,
          foreground: marromEscuro,
          borderSide: null,
          elevation: 0,
        );
    }
  }
}
