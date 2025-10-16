import 'package:flutter/material.dart';
import '../../shared/shared_colors.dart';
import '../../shared/shared_styles.dart';
import 'character_card_view_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterCardViewModel vm;
  const CharacterCard({super.key, required this.vm});

  // cor da casa (chip)
  Color _houseColor(String? house) {
    switch ((house ?? '').toLowerCase()) {
      case 'gryffindor':
      case 'grifinória':
        return grifinoriaColor;
      case 'slytherin':
      case 'sonserina':
        return sonserinaColor;
      case 'ravenclaw':
      case 'corvinal':
        return corvinalColor;
      case 'hufflepuff':
      case 'lufa-lufa':
        return lufaColorr;
      default:
        return azulMedio;
    }
  }

  Widget _statusChip(bool? alive) {
    final ok = alive == true;
    return Chip(
      label: Text(ok ? 'Vivo' : 'Falecido', style: const TextStyle(fontFamily: 'Inter')),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      backgroundColor: ok ? sonserinaColor.withOpacity(.15) : grifinoriaColor.withOpacity(.15),
      labelStyle: TextStyle(
        color: ok ? sonserinaColor : grifinoriaColor,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final houseColor = _houseColor(vm.house);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      clipBehavior: Clip.hardEdge,
      color: brancoPadrao,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: azulEscuro, width: 1.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar / imagem
              _CharacterAvatar(image: vm.image, badgeColor: houseColor),

              const SizedBox(width: 14),

              // Conteúdo
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nome + status
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            vm.name,
                            style: button1Bold.copyWith(
                              color: azulEscuro,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (vm.alive != null) _statusChip(vm.alive),
                      ],
                    ),
                    if ((vm.actor ?? '').isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text('Intérprete: ${vm.actor}',
                          style: paragraph2Medium.copyWith(color: azulEscuro)),
                    ],

                    const SizedBox(height: 8),

                    // Chips de casa / espécie / patrono
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if ((vm.house ?? '').isNotEmpty)
                          _Chip(text: vm.house!, color: houseColor),
                        if ((vm.species ?? '').isNotEmpty)
                          _Chip(text: vm.species!, color: azulMedio),
                        if ((vm.patronus ?? '').isNotEmpty)
                          _Chip(text: 'Patrono: ${vm.patronus!}', color: marromClaro),
                      ],
                    ),

                    // Linha dourada
                    Container(
                      height: 1,
                      color: marromClaro.withOpacity(0.6),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),

                    // Detalhes (ancestralidade + varinha)
                    if ((vm.ancestry ?? '').isNotEmpty)
                      _MetaRow(icon: Icons.family_restroom, label: 'Ancestralidade', value: vm.ancestry!),
                    if (vm.wand != null)
                      _MetaRow(
                        icon: Icons.auto_awesome,
                        label: 'Varinha',
                        value: [
                          if ((vm.wand!.wood ?? '').isNotEmpty) 'madeira: ${vm.wand!.wood}',
                          if ((vm.wand!.core ?? '').isNotEmpty) 'núcleo: ${vm.wand!.core}',
                          if (vm.wand!.length != null) '${vm.wand!.length!.toStringAsFixed(1)}"'
                        ].join(' · '),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color color;
  const _Chip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, color: Colors.white)),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _MetaRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: azulEscuro),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Inter', color: azulEscuro, fontSize: 14),
                children: [
                  TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CharacterAvatar extends StatelessWidget {
  final String? image;
  final Color badgeColor;
  const _CharacterAvatar({required this.image, required this.badgeColor});

  @override
  Widget build(BuildContext context) {
    final double size = 72;

    Widget avatar;
    if (image == null || image!.isEmpty) {
      avatar = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: azulClaro.withOpacity(.35),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.person, size: 36, color: azulEscuro),
      );
    } else if (image!.startsWith('http')) {
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(image!, width: size, height: size, fit: BoxFit.cover),
      );
    } else {
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(image!, width: size, height: size, fit: BoxFit.cover),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
              border: Border.all(color: brancoPadrao, width: 2),
            ),
            child: const Icon(Icons.shield, size: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
