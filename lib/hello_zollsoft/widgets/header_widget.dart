import 'package:bewerbung_zollsoft/common_widgets/contact_button_widget.dart';
import 'package:bewerbung_zollsoft/common_widgets/heading_indicator_with_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final isSmall = width < 800;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingIndicatorWithTitleWidget(title: 'Hallo Zollsoft!'),
              const SizedBox(height: 8),
              Text(
                'Meine Bewerbung & Story als Flutter Developer',
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
        if (isSmall) const SizedBox(width: 16),
        if (isSmall) _showAvatarSmallScreens(theme),
      ],
    );
  }

  Widget _showAvatarSmallScreens(ThemeData theme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.colorScheme.primary, width: 2),
          ),
          child: const CircleAvatar(
            radius: 32,
            foregroundImage: AssetImage('assets/images/portrait.webp'),
          ),
        ),
        const SizedBox(height: 8),
        _buildContactRow(),
      ],
    );
  }

  Widget _buildContactRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 5,
      children: [
        ContactButtonWidget(
          icon: Icons.email_outlined,
          tooltip: 'E-Mail schreiben',
          onTap: () =>
              launchUrl(Uri(scheme: 'mailto', path: 'hello@fynn-gerdes.dev')),
        ),
        ContactButtonWidget(
          icon: Icons.code_rounded,
          tooltip: 'GitHub öffnen',
          onTap: () => launchUrl(
            Uri.parse('https://github.com/fynngerdes/bewerbung_zollsoft'),
            mode: LaunchMode.externalApplication,
          ),
        ),
      ],
    );
  }
}
