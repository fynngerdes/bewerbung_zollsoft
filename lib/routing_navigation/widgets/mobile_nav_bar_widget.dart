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
        label: 'Anschreiben',
      ),
      const NavigationDestination(
        icon: Icon(Icons.history_edu_outlined),
        selectedIcon: Icon(Icons.history_edu),
        label: 'Lebenslauf',
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
