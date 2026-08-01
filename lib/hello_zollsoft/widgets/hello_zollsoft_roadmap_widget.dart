import 'package:flutter/material.dart';

class HelloZollsoftRoadmapWidget extends StatelessWidget {
  const HelloZollsoftRoadmapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final useHorizontal = width > 1000;

    final steps = <Widget>[
      _roadmapStep(
        context,
        stepNumber: '1',
        title: 'Das Fundament',
        subtitle: 'Java-Fernstudium (ILS)',
        description:
            'Fundierte Ausbildung in Objektorientierter Programmierung (OOP) und den essenziellen Prinzipien der Softwareentwicklung.',
        icon: Icons.school_outlined,
        cardColor: theme.colorScheme.surfaceContainer,
        onCardColor: theme.colorScheme.onSurface,
      ),
      _roadmapStep(
        context,
        stepNumber: '2',
        title: 'Der Fokus auf Flutter',
        subtitle: 'Spezialisierung & Architektur',
        description:
            'Einstieg in das Flutter-Ökosystem: Von den ersten eigenen Widgets über die Navigation mit GoRouter bis hin zum State-Management mit Riverpod.',
        icon: Icons.layers_outlined,
        cardColor: theme.colorScheme.secondaryContainer.withValues(alpha: 0.7),
        onCardColor: theme.colorScheme.onSecondaryContainer,
      ),
      _roadmapStep(
        context,
        stepNumber: '3',
        title: 'Praxis & Produktion',
        subtitle: 'Reale Anwendungen',
        description:
            'Entwicklung praxiserprobter Apps – darunter ein firmeninternes Guthaben-Card-Scanning-Tool sowie eine private Tracking-App zur Konsumanalyse.',
        icon: Icons.rocket_launch_outlined,
        cardColor: theme.colorScheme.primaryContainer,
        onCardColor: theme.colorScheme.onPrimaryContainer,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mein Weg zum Code', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 20),
        if (useHorizontal)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: steps[0]),
                _roadmapConnector(context, isHorizontal: true),
                Expanded(child: steps[1]),
                _roadmapConnector(context, isHorizontal: true),
                Expanded(child: steps[2]),
              ],
            ),
          )
        else
          Column(
            children: [
              steps[0],
              _roadmapConnector(context, isHorizontal: false),
              steps[1],
              _roadmapConnector(context, isHorizontal: false),
              steps[2],
            ],
          ),
      ],
    );
  }
}

Widget _roadmapStep(
  BuildContext context, {
  required String stepNumber,
  required String title,
  required String subtitle,
  required String description,
  required IconData icon,
  required Color cardColor,
  required Color onCardColor,
}) {
  final theme = Theme.of(context);
  return Card(
    elevation: 0,
    color: cardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: theme.colorScheme.outlineVariant),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: onCardColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: onCardColor, size: 20),
              ),
              Flexible(
                child: Text(
                  'Schritt $stepNumber',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: onCardColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(color: onCardColor),
          ),
          Text(
            subtitle,
            style: theme.textTheme.titleSmall?.copyWith(
              color: onCardColor.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(color: onCardColor),
          ),
        ],
      ),
    ),
  );
}

Widget _roadmapConnector(BuildContext context, {required bool isHorizontal}) {
  final theme = Theme.of(context);
  return Center(
    child: Container(
      width: isHorizontal ? 16 : 2,
      height: isHorizontal ? 2 : 16,
      color: theme.colorScheme.outlineVariant,
    ),
  );
}
