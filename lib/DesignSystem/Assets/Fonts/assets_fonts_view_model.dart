import 'package:flutter/material.dart';

class AssetsFonts {
  final String label;       // Ex.: 'Inter Bold (700)'
  final String fontFamily;  // 'Inter'
  final FontWeight weight;  // FontWeight.w700
  final double size;        // Ex.: 18

  AssetsFonts({
    required this.label,
    required this.fontFamily,
    required this.weight,
    required this.size,
  });
}

class AssetsFontsViewModel {
  final List<AssetsFonts> fonts;

  AssetsFontsViewModel({required this.fonts});

  factory AssetsFontsViewModel.sample() {
    return AssetsFontsViewModel(
      fonts: [
        AssetsFonts(label: 'Inter Regular (400)',   fontFamily: 'Inter', weight: FontWeight.w400, size: 18),
        AssetsFonts(label: 'Inter SemiBold (600)',  fontFamily: 'Inter', weight: FontWeight.w600, size: 18),
        AssetsFonts(label: 'Inter Bold (700)',      fontFamily: 'Inter', weight: FontWeight.w700, size: 18),
        AssetsFonts(label: 'Inter ExtraBold (800)', fontFamily: 'Inter', weight: FontWeight.w800, size: 18),
      ],
    );
  }
}
