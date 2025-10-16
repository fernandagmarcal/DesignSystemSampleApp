import 'package:designsystemsampleapp/DesignSystem/shared/shared_colors.dart';
import 'package:flutter/material.dart';
import 'action_button.dart';
import 'action_button_view_model.dart';

class ActionButtonGallery extends StatelessWidget {
  const ActionButtonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ButtonsRow(title: 'Sem ícone', iconPosition: IconPosition.none),
          SizedBox(height: 32),
          _ButtonsRow(title: 'Com ícone (esquerdo)', iconPosition: IconPosition.left),
          SizedBox(height: 32),
          _ButtonsRow(title: 'Com ícone (direito)', iconPosition: IconPosition.right),],),);
  }
}

class _ButtonsRow extends StatelessWidget {
  final String title;
  final IconPosition iconPosition;

  const _ButtonsRow({required this.title, required this.iconPosition});

  @override
  Widget build(BuildContext context) {
    return Column( children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          color: azulPrincipal, // fundo txt
          child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: marromClarinho, // cor do txt
              fontWeight: FontWeight.w700,),),), const SizedBox(height: 32),

      // espaço texto/botões
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _ButtonsColumn(style: ActionButtonStyle.primary,  iconPosition: iconPosition),
            _ButtonsColumn(style: ActionButtonStyle.secondary, iconPosition: iconPosition),
            _ButtonsColumn(style: ActionButtonStyle.tertiary, iconPosition: iconPosition),],),],);
  }
}

class _ButtonsColumn extends StatelessWidget {
  final ActionButtonStyle style;
  final IconPosition iconPosition;

  const _ButtonsColumn({required this.style, required this.iconPosition});

  @override
  Widget build(BuildContext context) {
    //icon padrao sample
    final IconData? icon =
    iconPosition == IconPosition.none ? null : Icons.flare;

    return Column(
      children: [
        // Large
        ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.large,
            style: style,
            text: 'Large',
            icon: icon,
            iconPosition: iconPosition,
            onPressed: () {},),),
        const SizedBox(height: 16),

        // Medium
        ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.medium,
            style: style,
            text: 'Medium',
            icon: icon,
            iconPosition: iconPosition,
            onPressed: () {},),),
        const SizedBox(height: 16),

        // Small
        ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.small,
            style: style,
            text: 'Small',
            icon: icon,
            iconPosition: iconPosition,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

