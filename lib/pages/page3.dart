import 'package:bewerbung_zollsoft/common_widgets/heading_indicator_with_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

enum _CvFilter {
  all('Alle', Icons.all_inclusive),
  experience('Erfahrung & Projekte', Icons.work_outline),
  education('Ausbildung', Icons.school_outlined),
  skills('Skill-Matrix', Icons.psychology_outlined);

  final String label;
  final IconData icon;
  const _CvFilter(this.label, this.icon);
}

class _Page3State extends State<Page3> {
  _CvFilter _selectedFilter = _CvFilter.all;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16.0 : 32.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingIndicatorWithTitleWidget(title: 'Lebenslauf'),
                const SizedBox(height: 8),
                Text(
                  'Fynn Gerdes • Entwickler aus Leidenschaft für moderne & performante Apps',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),

                // Header Profile Card
                _buildProfileHeaderCard(context, isMobile),
                const SizedBox(height: 24),

                // Filter Buttons
                _buildFilterChips(context),
                const SizedBox(height: 24),

                // Dynamic Content based on selected filter
                if (_selectedFilter == _CvFilter.all ||
                    _selectedFilter == _CvFilter.experience) ...[
                  _buildExperienceSection(context, isMobile),
                  const SizedBox(height: 32),
                ],

                if (_selectedFilter == _CvFilter.all ||
                    _selectedFilter == _CvFilter.education) ...[
                  _buildEducationSection(context, isMobile),
                  const SizedBox(height: 32),
                ],

                if (_selectedFilter == _CvFilter.all ||
                    _selectedFilter == _CvFilter.skills) ...[
                  _buildSkillMatrixSection(context, isMobile),
                  const SizedBox(height: 32),
                  _buildSoftSkillsSection(context, isMobile),
                  const SizedBox(height: 32),
                ],

                // Footer CTA Card
                _buildFooterCtaCard(context, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeaderCard(BuildContext context, bool isMobile) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 20.0 : 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.badge_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fynn Gerdes',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Bewerbung als Flutter Developer @ zollsoft GmbH',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
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
              'Autodidaktischer Flutter Developer mit fundiertem Java/OOP-Wissen. '
              'Fasziniert von performanter Softwareentwicklung, reaktivem State Management (Riverpod) '
              'und der Erstellung benutzerfreundlicher Anwendungen im Apple- & Cross-Platform-Ökosystem.',
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _buildInfoBadge(
                  context,
                  Icons.location_on_outlined,
                  'Jena / Remote',
                ),
                _buildInfoBadge(
                  context,
                  Icons.email_outlined,
                  'fynn.gerdes@outlook.com',
                  onTap: () => launchUrl(
                    Uri(scheme: 'mailto', path: 'fynn.gerdes@outlook.com'),
                  ),
                ),
                _buildInfoBadge(
                  context,
                  Icons.code_rounded,
                  'github.com/fynngerdes',
                  onTap: () => launchUrl(
                    Uri.parse('https://github.com/fynngerdes'),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(
    BuildContext context,
    IconData icon,
    String label, {
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final widget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: widget,
      );
    }
    return widget;
  }

  Widget _buildFilterChips(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _CvFilter.values.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selected: isSelected,
              showCheckmark: false,
              avatar: Icon(
                filter.icon,
                size: 16,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
              ),
              label: Text(filter.label),
              selectedColor: theme.colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              backgroundColor: theme.colorScheme.surfaceContainerLow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              onSelected: (_) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context,
          'Berufserfahrung & Praxisprojekte',
          Icons.work_outline,
        ),
        const SizedBox(height: 16),
        _buildTimelineTile(
          context,
          period: '2023 – Heute',
          role: 'Flutter Developer (Eigenprojekte & Praxis)',
          subtitle: 'Autodidaktische Entwicklung & Anwendung',
          description:
              'Konzeption, Architektur und Umsetzung verschiedener praxiserprobter Anwendungen:',
          bulletPoints: [
            'Firmeninternes Card-Scanning-Tool: Mobile App zur Erfassung von Guthabencards via Kamera, Barcode/OCR & reaktivem Riverpod-State.',
            'Private Tracking-App: Modular entworfene App zur Konsumanalyse mit Offline-First Datenhaltung & Custom Material 3 Widgets.',
            'Zollsoft Bewerbungs-App: Deklaratives Shell-Routing (GoRouter), Theme-Manager (Riverpod), responsive UIs für Web & Desktop.',
          ],
          tags: [
            'Flutter',
            'Dart',
            'Riverpod',
            'GoRouter',
            'Material 3',
            'OCR / Barcode',
            'Clean Code',
          ],
          isCurrent: true,
        ),
        const SizedBox(height: 16),
        _buildTimelineTile(
          context,
          period: '2022 – 2023',
          role: 'Softwaredesign & Vertiefung',
          subtitle: 'Fokus auf Cross-Platform Entwicklung',
          description:
              'Intensivierung der Kenntnisse im Dart- & Flutter-Ökosystem:',
          bulletPoints: [
            'Entwicklung mehrerer Micro-Apps zur Beherrschung deklarativer UI-Muster.',
            'Vertiefung von State-Management-Paradigmen (Riverpod, Provider) und Async Data Handling.',
            'Strukturierte Versionsverwaltung und Open-Source Praxis auf GitHub.',
          ],
          tags: ['Dart', 'Flutter', 'OOP', 'Git', 'GitHub'],
          isCurrent: false,
        ),
      ],
    );
  }

  Widget _buildEducationSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context,
          'Ausbildung & Qualifikationen',
          Icons.school_outlined,
        ),
        const SizedBox(height: 16),
        _buildTimelineTile(
          context,
          period: 'Fernstudium',
          role: 'Java-Entwickler (ILS)',
          subtitle: 'Institut für Lernsysteme',
          description:
              'Fundierte Ausbildung in den Grundlagen der Softwareentwicklung:',
          bulletPoints: [
            'Objektorientierte Programmierung (OOP), Klassenstrukturen, Vererbung & Polymorphie.',
            'Algorithmen, Datenstrukturen & Software-Entwurfsmuster (Design Patterns).',
            'Verbindung von fundiertem theoretischem Java-Wissen mit praxisnaher Anwendung in Dart/Flutter.',
          ],
          tags: ['Java', 'OOP', 'Software-Architektur', 'Clean Code'],
          isCurrent: false,
        ),
        const SizedBox(height: 16),
        _buildTimelineTile(
          context,
          period: 'Kontinuierlich',
          role: 'Autodidaktische Spezialisierung: Flutter & Mobile',
          subtitle: 'Selbststudium & Community',
          description:
              'Ständige Erweiterung des methodischen und technischen Repertoires:',
          bulletPoints: [
            'Moderne App-Architekturen (Layered Architecture: Data, Domain, Presentation).',
            'Platform Channels & Ausblick auf Native Interop (Swift / macOS) für tomedo®.',
            'Testing-Strategien (Unit Tests, Widget Tests) & CI/CD Grundlagen.',
          ],
          tags: ['Flutter', 'Riverpod Generator', 'Platform Channels', 'Swift'],
          isCurrent: true,
        ),
      ],
    );
  }

  Widget _buildSkillMatrixSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context,
          'Skill-Matrix & Technologien',
          Icons.psychology_outlined,
        ),
        const SizedBox(height: 16),
        if (isMobile)
          Column(
            children: [
              _buildSkillCategoryCard(
                context,
                'Core Stack',
                Icons.layers_outlined,
                [
                  _SkillRating('Flutter & Dart', 0.90, 'Sehr gut'),
                  _SkillRating('Riverpod (State Management)', 0.85, 'Sehr gut'),
                  _SkillRating('GoRouter (Navigation)', 0.85, 'Sehr gut'),
                  _SkillRating('Material Design 3', 0.90, 'Sehr gut'),
                ],
              ),
              const SizedBox(height: 16),
              _buildSkillCategoryCard(
                context,
                'Sprachen & Fundament',
                Icons.code_outlined,
                [
                  _SkillRating('Java & OOP', 0.80, 'Gute Kenntnisse'),
                  _SkillRating(
                    'Swift / macOS (Native Channels)',
                    0.60,
                    'Lernfokus',
                  ),
                  _SkillRating('HTML / CSS', 0.75, 'Gute Kenntnisse'),
                  _SkillRating(
                    'SQL & Local DBs / Caching',
                    0.70,
                    'Gute Kenntnisse',
                  ),
                ],
              ),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildSkillCategoryCard(
                  context,
                  'Core Stack',
                  Icons.layers_outlined,
                  [
                    _SkillRating('Flutter & Dart', 0.90, 'Sehr gut'),
                    _SkillRating(
                      'Riverpod (State Management)',
                      0.85,
                      'Sehr gut',
                    ),
                    _SkillRating('GoRouter (Navigation)', 0.85, 'Sehr gut'),
                    _SkillRating('Material Design 3', 0.90, 'Sehr gut'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSkillCategoryCard(
                  context,
                  'Sprachen & Fundament',
                  Icons.code_outlined,
                  [
                    _SkillRating('Java & OOP', 0.80, 'Gute Kenntnisse'),
                    _SkillRating(
                      'Swift / macOS (Native Channels)',
                      0.60,
                      'Lernfokus',
                    ),
                    _SkillRating('HTML / CSS', 0.75, 'Gute Kenntnisse'),
                    _SkillRating(
                      'SQL & Local DBs / Caching',
                      0.70,
                      'Gute Kenntnisse',
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildSoftSkillsSection(BuildContext context, bool isMobile) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star_outline,
                  color: theme.colorScheme.primary,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  'Arbeitsweise & Sprachen',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildSoftSkillChip(
                  context,
                  'Eigeninitiative & Problem-Solver',
                ),
                _buildSoftSkillChip(context, 'Clean Code & Refactoring-Liebe'),
                _buildSoftSkillChip(
                  context,
                  'Begeisterung für Apple/macOS Ökosystem',
                ),
                _buildSoftSkillChip(context, 'Deutsch (Muttersprache)'),
                _buildSoftSkillChip(context, 'Englisch (Fließend / B2-C1)'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoftSkillChip(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterCtaCard(BuildContext context, bool isMobile) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 20.0 : 28.0),
        child: Column(
          children: [
            Text(
              'Lust auf ein Kennenlernen?',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Ich freue mich darauf, euch persönlich von meinen Fähigkeiten zu überzeugen.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer.withValues(
                  alpha: 0.85,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: () => launchUrl(
                    Uri(scheme: 'mailto', path: 'fynn.gerdes@outlook.com'),
                  ),
                  icon: const Icon(Icons.email_outlined),
                  label: const Text('E-Mail schreiben'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => launchUrl(
                    Uri.parse('https://github.com/fynngerdes'),
                    mode: LaunchMode.externalApplication,
                  ),
                  icon: const Icon(Icons.code_rounded),
                  label: const Text('GitHub Profil'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineTile(
    BuildContext context, {
    required String period,
    required String role,
    required String subtitle,
    required String description,
    required List<String> bulletPoints,
    required List<String> tags,
    required bool isCurrent,
  }) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isCurrent
              ? theme.colorScheme.primary.withValues(alpha: 0.4)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
          width: isCurrent ? 1.5 : 1.0,
        ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    period,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isCurrent
                          ? theme.colorScheme.onPrimaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Aktuell',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              role,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            ...bulletPoints.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (tags.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    List<_SkillRating> skills,
  ) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...skills.map((skill) => _buildSkillProgressTile(context, skill)),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillProgressTile(BuildContext context, _SkillRating skill) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                skill.levelText,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: skill.percentage,
              minHeight: 6,
              backgroundColor: theme.colorScheme.surfaceContainerHigh,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillRating {
  final String name;
  final double percentage;
  final String levelText;

  _SkillRating(this.name, this.percentage, this.levelText);
}
