import '/DesignSystem/Components/CharacterCard/character_card_view_model.dart';

class WandModel {
  final String? wood;
  final String? core;
  final double? length;

  WandModel({this.wood, this.core, this.length});

  factory WandModel.fromJson(Map<String, dynamic> json) {
    return WandModel(
      wood: json['wood'] as String?,
      core: json['core'] as String?,
      length: json['length'] is num ? (json['length'] as num).toDouble() : null,
    );
  }

  // Mapeamento para o ViewModel do seu Card de Personagem
  WandVm toViewModel() {
    return WandVm(
      wood: wood,
      core: core,
      length: length,
    );
  }
}

class CharacterModel {
  final String id;
  final String name;
  final String? actor;
  final String? house;
  final String? species;
  final String? patronus;
  final bool? alive;
  final String? ancestry;
  final WandModel? wand;
  final String? image;

  CharacterModel({
    required this.id,
    required this.name,
    this.actor,
    this.house,
    this.species,
    this.patronus,
    this.alive,
    this.ancestry,
    this.wand,
    this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Desconhecido',
      actor: json['actor'] as String?,
      house: json['house'] as String?,
      species: json['species'] as String?,
      patronus: json['patronus'] as String?,
      alive: json['alive'] as bool?,
      ancestry: json['ancestry'] as String?,
      wand: json['wand'] != null ? WandModel.fromJson(json['wand'] as Map<String, dynamic>) : null,
      image: json['image'] as String?,
    );
  }

  // Mapeamento para o ViewModel do seu Card de Personagem (Domain Model -> Component ViewModel)
  CharacterCardViewModel toViewModel() {
    return CharacterCardViewModel(
      name: name,
      actor: actor,
      house: house,
      species: species,
      patronus: patronus,
      alive: alive,
      ancestry: ancestry,
      wand: wand?.toViewModel(),
      image: image,
    );
  }
}