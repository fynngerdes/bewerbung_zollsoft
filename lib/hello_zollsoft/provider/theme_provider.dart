import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
ThemeData theme(Ref ref, {required Brightness brightness}) {
  final seedColor = ref.watch(themeSeedColorProvider);
  final colorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: brightness,
  );
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    fontFamily: 'Inter',
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: -1,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: colorScheme.primary,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurfaceVariant,
      ),
      bodyLarge: TextStyle(
        color: colorScheme.onSurface,
        height: 1.6,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: colorScheme.onSurface,
        height: 1.4,
        fontSize: 14,
      ),
      bodySmall: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 12),
      labelMedium: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    ),
  );
}

@Riverpod(keepAlive: true)
class SwitchThemeMode extends _$SwitchThemeMode {
  @override
  ThemeMode build() => ThemeMode.system;

  void toggleThemeMode(ThemeMode themeMode) => state = themeMode;
}

@Riverpod(keepAlive: true)
class ThemeSeedColor extends _$ThemeSeedColor {
  @override
  Color build() => Colors.indigo;

  void setSeedColor(Color color) => state = color;
}
