import 'package:flutter/material.dart';
import '../../shared/shared_colors.dart';
import '../../Components/CharacterCard/character_card.dart';
import '../../Components/CharacterCard/character_card_view_model.dart';

class CharacterCardSampleScreen extends StatelessWidget {
  const CharacterCardSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <CharacterCardViewModel>[
      CharacterCardViewModel(
        name: 'Harry Potter',
        actor: 'Daniel Radcliffe',
        house: 'Gryffindor',
        species: 'Humano',
        patronus: 'Cervo',
        alive: true,
        ancestry: 'Mestiço',
        wand: const WandVm(wood: 'Azevinho', core: 'Pena de Fênix', length: 11.0),
        image: 'https://i.imgur.com/1J2H5cG.jpeg', // pode trocar por asset
      ),
      CharacterCardViewModel(
        name: 'Severus Snape',
        actor: 'Alan Rickman',
        house: 'Slytherin',
        species: 'Humano',
        patronus: 'Corça',
        alive: false,
        ancestry: 'Mestiço',
        wand: const WandVm(wood: 'Desconhecida', core: 'Desconhecido'),
        image: '', // sem imagem -> placeholder
      ),
      CharacterCardViewModel(
        name: 'Luna Lovegood',
        actor: 'Evanna Lynch',
        house: 'Ravenclaw',
        species: 'Humana',
        patronus: 'Lebre',
        alive: true,
        ancestry: 'Puro-sangue',
        image: 'https://i.imgur.com/Zv8Uq6D.jpeg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Card de Personagem (HP)')),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: items.length,
        itemBuilder: (_, i) => CharacterCard(vm: items[i]),
      ),
    );
  }
}
