import 'package:animations/animations.dart';
import 'package:bewerbung_zollsoft/pages/page2.dart';
import 'package:bewerbung_zollsoft/hello_zollsoft/pages/hello_zollsoft_page.dart';
import 'package:bewerbung_zollsoft/pages/page3.dart';
import 'package:bewerbung_zollsoft/routing_navigation/pages/shell_layout_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute(
        builder: (context, state, navigationShell) =>
            ShellLayoutPage(navigationShell: navigationShell),
        navigatorContainerBuilder: (context, navigationShell, children) {
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: children[navigationShell.currentIndex],
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HelloZollsoftPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/page2',
                builder: (context, state) => const Page2(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/page3',
                builder: (context, state) => const Page3(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
