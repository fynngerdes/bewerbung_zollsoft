import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileNavBarWidget extends StatelessWidget {
  const MobileNavBarWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    List<NavigationDestination> destinations = [
      const NavigationDestination(
        icon: Icon(Icons.waving_hand_outlined),
        selectedIcon: Icon(Icons.waving_hand),
        label: 'Hallo Zollsoft!',
      ),
      const NavigationDestination(
        icon: Icon(Icons.description_outlined),
        selectedIcon: Icon(Icons.description),
        label: 'Lebenslauf',
      ),
      const NavigationDestination(
        icon: Icon(Icons.file_open_outlined),
        selectedIcon: Icon(Icons.file_open),
        label: 'Dokumente',
      ),
    ];

    return NavigationBar(
      destinations: destinations,

      onDestinationSelected: (index) {
        navigationShell.goBranch(index);
      },
      selectedIndex: navigationShell.currentIndex,
    );
  }
}
