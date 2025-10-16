import 'package:flutter/material.dart';
import '../shared/shared_colors.dart';

/// Modelo de cor do Design System (nome, valor, categoria opcional)
class DsColorEntry {
  final String name;
  final Color color;
  final String? category;

  DsColorEntry({
    required this.name,
    required this.color,
    this.category,
  });
}

/// ViewModel que expõe a lista de cores do sistema
class ColorsViewModel {
  final List<DsColorEntry> colors;

  ColorsViewModel({required this.colors});

  /// Factory para gerar a paleta completa de exemplo
  factory ColorsViewModel.sample() {
    return ColorsViewModel(colors: [
      DsColorEntry(name: 'Azul Escuro', color: azulEscuro, category: 'Base'),
      DsColorEntry(name: 'Azul Principal', color: azulPrincipal, category: 'Base'),
      DsColorEntry(name: 'Azul Médio', color: azulMedio, category: 'Base'),
      DsColorEntry(name: 'Azul Claro', color: azulClaro, category: 'Base'),
      DsColorEntry(name: 'Background', color: backgroundColor, category: 'Base'),
      DsColorEntry(name: 'Cinza Escuro', color: cinzaEscuro, category: 'Neutro'),
      DsColorEntry(name: 'Cinza Claro', color: cinzaClaro, category: 'Neutro'),
      DsColorEntry(name: 'Marrom Claro', color: marromClaro, category: 'Apoio'),
      DsColorEntry(name: 'Marrom Queimado', color: marromQueimado, category: 'Apoio'),
      DsColorEntry(name: 'Marrom Clarinho', color: marromClarinho, category: 'Apoio'),
      DsColorEntry(name: 'Bege Claro', color: begeClaro, category: 'Apoio'),
      DsColorEntry(name: 'Preto Padrão', color: pretoPadrao, category: 'Neutro'),
      DsColorEntry(name: 'Branco Padrão', color: brancoPadrao, category: 'Neutro'),
      DsColorEntry(name: 'Grifinória', color: grifinoriaColor, category: 'Casas'),
      DsColorEntry(name: 'Lufa-Lufa', color: lufaColorr, category: 'Casas'),
      DsColorEntry(name: 'Sonserina', color: sonserinaColor, category: 'Casas'),
      DsColorEntry(name: 'Corvinal', color: corvinalColor, category: 'Casas'),
    ]);
  }
}
