import 'package:flutter/material.dart';
import '../../../DesignSystem/Colors/colors_view_model.dart';
import '../../shared/shared_colors.dart';

class ColorsSampleScreen extends StatelessWidget {
  final ColorsViewModel vm;

  const ColorsSampleScreen({super.key, required this.vm});

  static Widget instantiate() => ColorsSampleScreen(vm: ColorsViewModel.sample());

  String _hex(Color c) {
    return '#'
        '${c.red.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${c.green.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${c.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final items = vm.colors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paleta de Cores'),
        backgroundColor: azulEscuro,
        foregroundColor: brancoPadrao,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (_, i) {
            final e = items[i];
            final hex = _hex(e.color);
            return _ColorCard(entry: e, hex: hex);
          },
        ),
      ),
    );
  }
}

class _ColorCard extends StatelessWidget {
  final DsColorEntry entry;
  final String hex;

  const _ColorCard({required this.entry, required this.hex});

  Color _textColorFor(Color bg) {
    final luminance = bg.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final onColor = _textColorFor(entry.color);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: entry.color,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                entry.category ?? '',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: onColor.withOpacity(0.85),
                ),
              ),
            ),
          ),
          Container(
            color: brancoPadrao,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: azulEscuro,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hex,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: cinzaEscuro,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
