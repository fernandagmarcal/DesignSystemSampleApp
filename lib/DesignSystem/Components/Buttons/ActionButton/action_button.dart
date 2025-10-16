// import 'package:flutter/material.dart';
// import 'action_button_view_model.dart';
// import 'action_button_styles.dart';
// import '../../../shared/shared_colors.dart';
//
// class ActionButton extends StatelessWidget {
//   final ActionButtonViewModel viewModel;
//
//   const ActionButton._({super.key, required this.viewModel});
//
//   static Widget instantiate({required ActionButtonViewModel viewModel}) {
//     return ActionButton._(viewModel: viewModel);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final v = ActionButtonStyles.of(
//       size: viewModel.size,
//       style: viewModel.style,
//     );
//
//     final Widget label = Text(
//       viewModel.text,
//       style: v.textStyle.copyWith(color: v.foreground),
//       textAlign: TextAlign.center,
//     );
//
//
//     final Widget child = viewModel.icon != null
//         ? Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(viewModel.icon, size: v.iconSize, color: v.foreground),
//         const SizedBox(width: 8),
//         label,
//       ],
//     )
//         : label;
//
//     return ElevatedButton(
//       onPressed: viewModel.onPressed,
//       style: ElevatedButton.styleFrom(
//         elevation: v.elevation,
//         backgroundColor: v.background,
//         foregroundColor: v.foreground,
//         shadowColor: Colors.black.withOpacity(0.25),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(v.radius),
//           side: v.borderSide ?? BorderSide.none,
//         ),
//         padding: v.padding,
//         textStyle: v.textStyle,
//       ),
//       child: child,
//     );
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import 'action_button_view_model.dart';
import 'action_button_styles.dart';
import '../../../shared/shared_colors.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final v = ActionButtonStyles.of(
      size: viewModel.size,
      style: viewModel.style,
    );

    // Label com tipografia/cores do DS
    final Widget label = Text(
      viewModel.text,
      style: v.textStyle.copyWith(color: v.foreground),
      textAlign: TextAlign.center,
    );

    // ===== Novo: posicionamento do ícone =====
    late final Widget child;

    final hasIcon = viewModel.icon != null;
    // Se o VM tiver o novo enum IconPosition, usamos; se não, default = left
    final iconPos = hasIcon ? viewModel.iconPosition : IconPosition.none;

    if (!hasIcon || iconPos == IconPosition.none) {
      // Sem ícone
      child = label;
    } else if (iconPos == IconPosition.left) {
      // Ícone à esquerda
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(viewModel.icon, size: v.iconSize, color: v.foreground),
          const SizedBox(width: 8),
          label,
        ],
      );
    } else {
      // Ícone à direita
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          label,
          const SizedBox(width: 8),
          Icon(viewModel.icon, size: v.iconSize, color: v.foreground),
        ],
      );
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: v.elevation,
        backgroundColor: v.background,
        foregroundColor: v.foreground,
        shadowColor: Colors.black.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(v.radius),
          side: v.borderSide ?? BorderSide.none,
        ),
        padding: v.padding,
        textStyle: v.textStyle,
      ),
      child: child,
    );
  }
}

