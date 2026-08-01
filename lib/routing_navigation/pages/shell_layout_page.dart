import 'package:bewerbung_zollsoft/routing_navigation/widgets/desktop_side_bar_widget.dart';
import 'package:bewerbung_zollsoft/routing_navigation/widgets/mobile_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellLayoutPage extends StatelessWidget {
  const ShellLayoutPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;

    return isMobile
        ? Scaffold(
            body: navigationShell,
            bottomNavigationBar: MobileNavBarWidget(
              navigationShell: navigationShell,
            ),
          )
        : Scaffold(
            body: DesktopSideBarWidget(navigationShell: navigationShell),
          );
  }
}
