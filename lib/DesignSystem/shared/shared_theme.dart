import 'package:flutter/material.dart';
import 'shared_colors.dart'; // usa as cores que você já migrou (azulEscuro, azulClaro, marromClaro, etc.)

class AppTheme {
  // Tema principal no visual do HP
  static ThemeData light() {
    final scheme = ColorScheme(
      brightness: Brightness.light,
      primary: azulEscuro,        // base azul profunda
      onPrimary: marromClaro,     // contraste quente
      secondary: marromClaro,     // dourado (destaque)
      onSecondary: azulEscuro,
      tertiary: azulMedio,
      onTertiary: brancoPadrao,
      background: backgroundColor,
      onBackground: azulClaro,
      surface: azulPrincipal,     // cartões/superfícies
      onSurface: marromClaro,
      error: Colors.red.shade700,
      onError: brancoPadrao,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: backgroundColor,

      // AppBar no padrão HP
      appBarTheme: AppBarTheme(
        backgroundColor: azulEscuro,
        foregroundColor: marromClaro,
        centerTitle: true,
        elevation: 0,
      ),

      // Botões padrão (navegação do menu inicial, etc.)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: azulMedio,     // botão padrão (azul)
          foregroundColor: brancoPadrao,
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(
            fontFamily: 'InterRegular',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      // Inputs no padrão HP
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brancoPadrao,
        hintStyle: const TextStyle(color: azulEscuro),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: azulEscuro, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: azulEscuro, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: azulEscuro, width: 2.5),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: azulMedio,
        labelStyle: const TextStyle(color: brancoPadrao),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide.none,
      ),

      cardTheme: CardTheme(
        color: brancoPadrao,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.all(12),
      ),

      // Tipografia base InterRegular (se já está no projeto, só reforçamos pesos/cores “default”)
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontFamily: 'InterRegularRegular', fontWeight: FontWeight.w800, color: marromClaro),
        titleMedium: TextStyle(fontFamily: 'InterRegular', fontWeight: FontWeight.w600, color: marromClaro),
        bodyLarge: TextStyle(fontFamily: 'InterRegular', fontWeight: FontWeight.w400, color: azulClaro),
        bodyMedium: TextStyle(fontFamily: 'InterRegular', fontWeight: FontWeight.w400, color: azulClaro),
        labelLarge: TextStyle(fontFamily: 'InterRegular', fontWeight: FontWeight.w600, color: azulEscuro),
      ),
    );
  }
}
