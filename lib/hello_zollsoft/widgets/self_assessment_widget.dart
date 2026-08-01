import 'package:bewerbung_zollsoft/hello_zollsoft/models/assessment_item_model.dart';
import 'package:flutter/material.dart';

class SelfAssessmentWidget extends StatelessWidget {
  const SelfAssessmentWidget({super.key});

  static const _mastered = [
    AssessmentItem(
      title: 'State Management',
      subtitle: 'Riverpod & Code Generation',
      description:
          'Saubere Trennung von UI und Business-Logik mit Riverpod (`@riverpod`).',
      tags: ['Riverpod', 'State Management'],
    ),
    AssessmentItem(
      title: 'UI & Responsive Layouts',
      subtitle: 'Custom Widgets & Material 3',
      description:
          'Deklaratives UI-Design, Material 3 Themes und adaptive Layouts für Web & Mobile.',
      tags: ['Flutter', 'Material 3'],
    ),
    AssessmentItem(
      title: 'Clean Code & OOP',
      subtitle: 'Dart & Java-Fundament',
      description:
          'Strukturierter Code, Entwurfsmuster und wartbare Softwarearchitektur.',
      tags: ['OOP', 'Clean Code'],
    ),
  ];

  static const _learning = [
    AssessmentItem(
      title: 'Platform Channels',
      subtitle: 'Native Interop (Swift / macOS)',
      description: 'Integration nativer APIs im Apple-Ökosystem für tomedo®.',
      tags: ['Swift', 'macOS', 'Channels'],
    ),
    AssessmentItem(
      title: 'Advanced Testing',
      subtitle: 'Widget & Integration Tests',
      description:
          'Ausbau automatisierter UI-Tests und CI/CD Release-Pipelines.',
      tags: ['Testing', 'CI/CD'],
    ),
    AssessmentItem(
      title: 'Offline-First & Performance',
      subtitle: 'Caching & Local DBs',
      description:
          'Effiziente Datenhaltung und Optimierung für datenintensive Apps.',
      tags: ['Performance', 'Offline-First'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isHorizontal = MediaQuery.sizeOf(context).width > 900;

    final masteredSection = _buildSection(
      context,
      title: 'Das beherrsche ich',
      icon: Icons.check_circle_outline,
      items: _mastered,
    );

    final learningSection = _buildSection(
      context,
      title: 'Das möchte ich lernen',
      icon: Icons.auto_stories_outlined,
      items: _learning,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Flutter Skill-Assessment', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        if (isHorizontal)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: masteredSection),
              const SizedBox(width: 16),
              Expanded(child: learningSection),
            ],
          )
        else
          Column(
            children: [
              masteredSection,
              const SizedBox(height: 16),
              learningSection,
            ],
          ),
      ],
    );
  }
}

Widget _buildSection(
  BuildContext context, {
  required String title,
  required IconData icon,
  required List<AssessmentItem> items,
}) {
  final theme = Theme.of(context);

  return Card(
    elevation: 0,
    color: theme.colorScheme.surfaceContainerHigh,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: theme.colorScheme.outlineVariant),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => _buildAssessmentTile(context, item)),
        ],
      ),
    ),
  );
}

Widget _buildAssessmentTile(BuildContext context, AssessmentItem item) {
  final theme = Theme.of(context);

  return Card(
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 8),
    color: theme.colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
      ),
    ),
    child: Theme(
      data: theme.copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: theme.colorScheme.onSurfaceVariant,
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Text(
          item.title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          item.subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        children: [
          Divider(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
            height: 1,
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          if (item.tags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: item.tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(),
                      ),
                      child: Text(
                        tag,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
          if (item.customWidget != null) ...[
            const SizedBox(height: 8),
            item.customWidget!,
          ],
        ],
      ),
    ),
  );
}
