import 'package:flutter/material.dart';
import '../shared/shared_colors.dart';

class ColorsItems {
  final String name;
  final Color color;
  final String? category;

  ColorsItems({
    required this.name,
    required this.color,
    this.category,
  });
}

class ColorsViewModel {
  final List<ColorsItems> colors;

  ColorsViewModel({required this.colors});

  factory ColorsViewModel.sample() {
    return ColorsViewModel(colors: [
      ColorsItems(name: 'Azul Escuro', color: azulEscuro, category: 'Base'),
      ColorsItems(name: 'Azul Principal', color: azulPrincipal, category: 'Base'),
      ColorsItems(name: 'Azul Médio', color: azulMedio, category: 'Base'),
      ColorsItems(name: 'Azul Claro', color: azulClaro, category: 'Base'),
      ColorsItems(name: 'Background', color: backgroundColor, category: 'Base'),
      ColorsItems(name: 'Cinza Escuro', color: cinzaEscuro, category: 'Neutro'),
      ColorsItems(name: 'Cinza Claro', color: cinzaClaro, category: 'Neutro'),
      ColorsItems(name: 'Marrom Claro', color: marromClaro, category: 'Apoio'),
      ColorsItems(name: 'Marrom Queimado', color: marromQueimado, category: 'Apoio'),
      ColorsItems(name: 'Marrom Clarinho', color: marromClarinho, category: 'Apoio'),
      ColorsItems(name: 'Bege Claro', color: begeClaro, category: 'Apoio'),
      ColorsItems(name: 'Preto Padrão', color: pretoPadrao, category: 'Neutro'),
      ColorsItems(name: 'Branco Padrão', color: brancoPadrao, category: 'Neutro'),
      ColorsItems(name: 'Grifinória', color: grifinoriaColor, category: 'Casas'),
      ColorsItems(name: 'Lufa-Lufa', color: lufaColorr, category: 'Casas'),
      ColorsItems(name: 'Sonserina', color: sonserinaColor, category: 'Casas'),
      ColorsItems(name: 'Corvinal', color: corvinalColor, category: 'Casas'),
    ]);
  }
}
