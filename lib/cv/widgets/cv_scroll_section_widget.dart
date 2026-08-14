import 'package:flutter/material.dart';
import '../models/cv_entry_model.dart';
import 'cv_card_widget.dart';

class CvScrollSectionWidget extends StatelessWidget {
  const CvScrollSectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.entries,
  });

  final String title;
  final IconData icon;
  final List<CvEntry> entries;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: primaryColor, size: 19),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(entries.length, (index) {
                final isLast = index == entries.length - 1;
                return Padding(
                  padding: EdgeInsets.only(right: isLast ? 0 : 16.0),
                  child: CvCardWidget(entry: entries[index]),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
