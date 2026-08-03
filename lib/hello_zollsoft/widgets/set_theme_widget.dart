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
        Text(
          'Theme-Demonstration',
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        _buildThemeModeSelector(ref, currentThemeMode),
        const SizedBox(height: 16),
        _buildColorPicker(context, ref, currentSeedColor),
      ],
    );
  }

  Widget _buildThemeModeSelector(WidgetRef ref, ThemeMode currentThemeMode) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Tooltip(
          message: 'Light',
          child: ChoiceChip(
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Icon(
              currentThemeMode == ThemeMode.light
                  ? Icons.wb_sunny
                  : Icons.wb_sunny_outlined,
            ),
            selected: currentThemeMode == ThemeMode.light,
            onSelected: (selected) {
              if (selected) {
                ref
                    .read(switchThemeModeProvider.notifier)
                    .toggleThemeMode(ThemeMode.light);
              }
            },
          ),
        ),
        Tooltip(
          message: 'System',
          child: ChoiceChip(
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Icon(
              currentThemeMode == ThemeMode.system
                  ? Icons.brightness_auto
                  : Icons.brightness_auto_outlined,
            ),
            selected: currentThemeMode == ThemeMode.system,
            onSelected: (selected) {
              if (selected) {
                ref
                    .read(switchThemeModeProvider.notifier)
                    .toggleThemeMode(ThemeMode.system);
              }
            },
          ),
        ),
        Tooltip(
          message: 'Dark',
          child: ChoiceChip(
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Icon(
              currentThemeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.dark_mode_outlined,
            ),
            selected: currentThemeMode == ThemeMode.dark,
            onSelected: (selected) {
              if (selected) {
                ref
                    .read(switchThemeModeProvider.notifier)
                    .toggleThemeMode(ThemeMode.dark);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorPicker(
    BuildContext context,
    WidgetRef ref,
    Color currentSeedColor,
  ) {
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
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,

              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.4),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
