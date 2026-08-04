import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/theme_provider.dart';

class SetThemeWidget extends ConsumerWidget {
  const SetThemeWidget({super.key});

  final List<Color> colors = const [
    Colors.green,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(switchThemeModeProvider);
    final currentSeedColor = ref.watch(themeSeedColorProvider);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: theme.colorScheme.outlineVariant, height: 24),
        _buildThemeModeSelector(theme, ref, currentThemeMode),
        const SizedBox(height: 14),
        _buildColorPicker(ref, currentSeedColor),
      ],
    );
  }

  Widget _buildThemeModeSelector(
    ThemeData theme,
    WidgetRef ref,
    ThemeMode currentThemeMode,
  ) {
    final primary = theme.colorScheme.primary;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildChip(
          theme: theme,
          primary: primary,
          tooltip: 'Light',
          icon: currentThemeMode == ThemeMode.light
              ? Icons.wb_sunny
              : Icons.wb_sunny_outlined,
          isSelected: currentThemeMode == ThemeMode.light,
          onTap: () {
            ref
                .read(switchThemeModeProvider.notifier)
                .toggleThemeMode(ThemeMode.light);
          },
        ),
        _buildChip(
          theme: theme,
          primary: primary,
          tooltip: 'System',
          icon: currentThemeMode == ThemeMode.system
              ? Icons.brightness_auto
              : Icons.brightness_auto_outlined,
          isSelected: currentThemeMode == ThemeMode.system,
          onTap: () {
            ref
                .read(switchThemeModeProvider.notifier)
                .toggleThemeMode(ThemeMode.system);
          },
        ),
        _buildChip(
          theme: theme,
          primary: primary,
          tooltip: 'Dark',
          icon: currentThemeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.dark_mode_outlined,
          isSelected: currentThemeMode == ThemeMode.dark,
          onTap: () {
            ref
                .read(switchThemeModeProvider.notifier)
                .toggleThemeMode(ThemeMode.dark);
          },
        ),
      ],
    );
  }

  Widget _buildChip({
    required ThemeData theme,
    required Color primary,
    required String tooltip,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: ChoiceChip(
        showCheckmark: false,
        selected: isSelected,
        onSelected: (selected) {
          if (selected) onTap();
        },
        label: Icon(
          icon,
          size: 18,
          color: isSelected ? primary : theme.colorScheme.onSurfaceVariant,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected
                ? primary.withValues(alpha: 0.5)
                : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
        selectedColor: primary.withValues(alpha: 0.15),
        backgroundColor: theme.colorScheme.surfaceContainerLow.withValues(
          alpha: 0.5,
        ),
      ),
    );
  }

  Widget _buildColorPicker(WidgetRef ref, Color currentSeedColor) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colors.map((color) {
        final isSelected = currentSeedColor.toARGB32() == color.toARGB32();

        return GestureDetector(
          onTap: () {
            ref.read(themeSeedColorProvider.notifier).setSeedColor(color);
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: isSelected ? 2.5 : 0.0,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.45),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
