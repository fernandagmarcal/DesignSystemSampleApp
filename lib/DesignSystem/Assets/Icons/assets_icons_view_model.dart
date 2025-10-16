import 'package:flutter/material.dart';
import '../../shared/shared_colors.dart';

class AssetsIcons {
  final String label;
  final IconData icon;
  final Color? color;

  AssetsIcons({required this.label, required this.icon, this.color});

  get name => null;
}

class AssetsIconsViewModel {
  final List<AssetsIcons> icons;

  AssetsIconsViewModel({required this.icons});

  factory AssetsIconsViewModel.sample() {
    return AssetsIconsViewModel(
      icons: [
        AssetsIcons(label: 'Seta: chevron_right', icon: Icons.chevron_right, color: azulEscuro),
        AssetsIcons(label: 'Mágica: flare',         icon: Icons.flare, color: azulEscuro),
        AssetsIcons(label: 'Varinha: auto_fix_high', icon: Icons.auto_fix_high, color: azulEscuro),
        AssetsIcons(label: 'Personagens: people_alt',     icon: Icons.people_alt,    color: azulEscuro),
        AssetsIcons(label: 'Menu book: menu_book',     icon: Icons.menu_book,    color: azulEscuro),
        AssetsIcons(label: 'Raio/Feitiço: electric_bolt', icon: Icons.electric_bolt, color: azulEscuro),
        AssetsIcons(label: 'Sair: exit_to_app', icon: Icons.exit_to_app, color: azulEscuro),
        AssetsIcons(label: 'Triste/Error: sentiment_dissatisfied', icon: Icons.sentiment_dissatisfied, color: azulEscuro),
        AssetsIcons(label: 'Atualizar: refresh', icon: Icons.refresh, color: azulEscuro),
        AssetsIcons(label: 'Imagem Quebrada: broken_image', icon: Icons.broken_image, color: azulEscuro),
        AssetsIcons(label: 'Staff: stars', icon: Icons.stars, color: azulEscuro),
        AssetsIcons(label: 'Escola/Hogwarts: school', icon: Icons.school, color: azulEscuro),
        AssetsIcons(label: 'Magia/Brilho: auto_awesome', icon: Icons.auto_awesome, color: azulEscuro),
        AssetsIcons(label: 'Brilho Forte: flare_sharp', icon: Icons.flare_sharp, color: azulEscuro),
        AssetsIcons(label: 'Família: family_restroom', icon: Icons.family_restroom, color: azulEscuro),
        AssetsIcons(label: 'Nascimento: cake', icon: Icons.cake, color: azulEscuro),
        AssetsIcons(label: 'Castelo/Hogwarts: castle', icon: Icons.castle, color: azulEscuro),
        AssetsIcons(label: 'Pessoa: person', icon: Icons.person, color: azulEscuro),
        AssetsIcons(label: 'Animação/Movimento: animation', icon: Icons.animation, color: azulEscuro),
        AssetsIcons(label: 'Foco Forte: center_focus_strong', icon: Icons.center_focus_strong, color: azulEscuro),
        AssetsIcons(label: 'Madeira: park', icon: Icons.park, color: azulEscuro),
        AssetsIcons(label: 'Tamanho: straighten', icon: Icons.straighten, color: azulEscuro),

      ],
    );
  }
}
