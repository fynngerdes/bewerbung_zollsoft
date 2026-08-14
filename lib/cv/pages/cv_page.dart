import 'package:bewerbung_zollsoft/common_widgets/heading_indicator_with_title_widget.dart';
import 'package:bewerbung_zollsoft/cv/data/cv_data.dart';
import 'package:bewerbung_zollsoft/cv/widgets/cv_horizontal_section.dart';
import 'package:flutter/material.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 32.0,
            vertical: 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildHeader(theme),
              const SizedBox(height: 30),

              // 1. Berufserfahrung
              const CvHorizontalSection(
                title: 'Berufserfahrung',
                icon: Icons.work_outline,
                entries: CvData.berufserfahrungEntries,
              ),
              const SizedBox(height: 32),

              // 2. Aus- und Weiterbildung
              const CvHorizontalSection(
                title: 'Aus- und Weiterbildung',
                icon: Icons.history_edu_outlined,
                entries: CvData.ausbildungEntries,
              ),
              const SizedBox(height: 32),

              // 3. Schulbildung
              const CvHorizontalSection(
                title: 'Schulbildung',
                icon: Icons.school_outlined,
                entries: CvData.schulbildungEntries,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildHeader(ThemeData theme) {
    return [
      const HeadingIndicatorWithTitleWidget(title: 'Lebenslauf'),
      const SizedBox(height: 8),
      Text(
        'Erfahrung, Ausbildung & Meilensteine',
        style: theme.textTheme.titleMedium,
      ),
    ];
  }
}
