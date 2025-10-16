import 'package:flutter/material.dart';

class WandVm {
  final String? wood;
  final String? core;
  final double? length;

  const WandVm({this.wood, this.core, this.length});
}

class CharacterCardViewModel {
  final String name;
  final String? actor;
  final String? house;
  final String? species;
  final String? patronus;
  final bool? alive;
  final String? ancestry;
  final WandVm? wand;

  final String? image;

  const CharacterCardViewModel({
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
}
