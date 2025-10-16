import 'package:flutter/material.dart';
import '../../../DesignSystem/Assets/Fonts/assets_fonts_view_model.dart';
import '../../../DesignSystem/Assets/Icons/assets_icons_view_model.dart';
import '../../shared/shared_colors.dart';

class AssetsSampleScreen extends StatelessWidget {
  final AssetsFontsViewModel fontsVm;
  final AssetsIconsViewModel iconsVm;

  const AssetsSampleScreen({
    super.key,
    required this.fontsVm,
    required this.iconsVm,
  });

  factory AssetsSampleScreen.instantiate() => AssetsSampleScreen(
    fontsVm: AssetsFontsViewModel.sample(),
    iconsVm: AssetsIconsViewModel.sample(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assets: Fontes & Ícones')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ===== Ícones =====
          _SectionTitle('Ícones'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: iconsVm.icons.map((i) {
              return _IconChip(label: i.label, iconData: i.icon, color: i.color ?? marromQueimado,);}).toList(),),

          const SizedBox(height: 28),

          // ===== Fontes =====
          _SectionTitle('Fontes (Inter)'),
          const SizedBox(height: 8),
          ...fontsVm.fonts.map((f) => _FontRow(sampleText: 'Venha conhecer o universo Harry Potter App!', label: f.label, family: f.fontFamily, weight: f.weight, size: f.size,),),],),);
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      // Alinhamento para garantir que o Container ocupe a largura máxima
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          color: azulPrincipal, // Fundo do texto (mantido)
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: marromClarinho, // Cor do texto (inspirada no novo estilo)
              fontWeight: FontWeight.w700,),),), const SizedBox(height: 32),],);}}

class _IconChip extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Color color;

  const _IconChip({
    required this.label,
    required this.iconData,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      avatar: Icon(iconData, color: Colors.white),
      backgroundColor: color,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

class _FontRow extends StatelessWidget {
  final String sampleText;
  final String label;
  final String family;
  final FontWeight weight;
  final double size;

  const _FontRow({
    required this.sampleText,
    required this.label,
    required this.family,
    required this.weight,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      title: Text(
        sampleText,
        style: TextStyle(
          fontFamily: family,
          fontWeight: weight,
          fontSize: size,
          color: brancoPadrao,
        ),
      ),
      subtitle: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: azulClaro),
      ),
    );
  }
}
