import 'package:bewerbung_zollsoft/common_widgets/contact_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopSideBarWidget extends StatelessWidget {
  const DesktopSideBarWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Material(
          color: theme.colorScheme.surfaceContainerLow,
          child: SizedBox(
            width: 280,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfileHeader(context),
                  const SizedBox(height: 12),
                  Expanded(child: _buildNavList(context)),
                  _buildFooter(context),
                ],
              ),
            ),
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: theme.colorScheme.outlineVariant.withAlpha(80),
        ),
        Expanded(child: navigationShell),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: theme.colorScheme.primary, width: 4),
            ),
            child: const CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage('assets/images/portrait.webp'),
            ),
          ),
          const SizedBox(height: 20),
          Text('Fynn Gerdes', style: theme.textTheme.titleLarge),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Bewerbung als Flutter Developer',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavList(BuildContext context) {
    final theme = Theme.of(context);
    final List<(String, IconData, IconData)> navItems = [
      ('Hallo Zollsoft!', Icons.waving_hand_outlined, Icons.waving_hand),
      ('Lebenslauf', Icons.history_edu_outlined, Icons.history_edu),
      ('Dokumente', Icons.file_open_outlined, Icons.file_open),
    ];

    return ListView.builder(
      itemCount: navItems.length,
      itemBuilder: (context, index) {
        final (title, icon, selectedIcon) = navItems[index];
        final isSelected = navigationShell.currentIndex == index;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            title: Text(title),
            leading: Icon(isSelected ? selectedIcon : icon),
            selected: isSelected,
            onTap: () => navigationShell.goBranch(index),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Colors.transparent,
            selectedTileColor: theme.colorScheme.primaryContainer,
            hoverColor: theme.colorScheme.primary.withAlpha(15),
            iconColor: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurfaceVariant,
            textColor: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurfaceVariant,
            titleTextStyle: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 15,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            trailing: isSelected
                ? Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant.withAlpha(60),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
