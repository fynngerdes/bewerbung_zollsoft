import 'package:flutter/material.dart';
import '../data/self_assessment_data.dart';
import '../models/self_assessment_item_model.dart';

class SelfAssessmentWidget extends StatelessWidget {
  const SelfAssessmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= 700;

        final cards = selfAssessmentItems
            .map((item) => _buildSelfAssessmentContainer(item, theme))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selbsteinschätzung', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 20),

            for (var i = 0; i < cards.length; i += 2) ...[
              if (i > 0) const SizedBox(height: 16),
              _buildRowPair(
                cards[i],
                i + 1 < cards.length ? cards[i + 1] : null,
                isWide,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildRowPair(Widget card1, Widget? card2, bool isWide) {
    if (!isWide) {
      return Column(
        children: [
          card1,
          if (card2 != null) ...[const SizedBox(height: 16), card2],
        ],
      );
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: card1),
          const SizedBox(width: 16),
          Expanded(child: card2 ?? const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildSelfAssessmentContainer(
    SelfAssessmentItemModel item,
    ThemeData theme,
  ) {
    final isMastered = item.isMastered;
    final cardColor = isMastered
        ? theme.colorScheme.primaryContainer.withValues(alpha: 0.25)
        : theme.colorScheme.tertiaryContainer.withValues(alpha: 0.25);

    final onCardColor = isMastered
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onTertiaryContainer;

    final accentColor = isMastered
        ? theme.colorScheme.primary
        : theme.colorScheme.tertiary;

    final badgeText = isMastered ? 'Gemeistert' : 'Am Vertiefen';
    final badgeIcon = isMastered
        ? Icons.check_circle_rounded
        : Icons.auto_stories_rounded;

    return Card(
      elevation: 0,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: accentColor.withValues(alpha: 0.25), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(item.icon, color: accentColor, size: 22),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: accentColor.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(badgeIcon, size: 14, color: accentColor),
                          const SizedBox(width: 5),
                          Text(
                            badgeText,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  item.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.35,
                    color: onCardColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: onCardColor.withValues(alpha: 0.85),
                    height: 1.35,
                  ),
                ),
                if (item.customWidget != null) ...[
                  const SizedBox(height: 12),
                  item.customWidget!,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
