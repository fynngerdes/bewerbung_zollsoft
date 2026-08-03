import 'package:flutter/material.dart';

class PitchWidget extends StatelessWidget {
  const PitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String title =
        "„Warum ein Quereinsteiger? Weil Leidenschaft der beste Antrieb ist.“";
    const String text =
        "Ich habe mir das Entwickeln mit Flutter und Dart nicht im Hörsaal, sondern am echten Code beigebracht. Für mich ist Softwareentwicklung keine bloße Berufswahl, sondern echte Begeisterung. Mein Quereinstieg bedeutet für euch: Ich brenne für das, was ich tue, lerne extrem schnell und bringe eine unvoreingenommene, lösungsorientierte Perspektive in euer Team.";
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outlineVariant, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            Text(text, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
