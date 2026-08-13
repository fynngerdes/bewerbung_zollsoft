import 'package:animations/animations.dart';
import 'package:bewerbung_zollsoft/documents/pages/documents_page.dart';
import 'package:bewerbung_zollsoft/hello_zollsoft/pages/hello_zollsoft_page.dart';
import 'package:bewerbung_zollsoft/cv/pages/cv_page.dart';
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
              GoRoute(path: '/cv', builder: (context, state) => const CvPage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dokumente',
                builder: (context, state) => const DocumentsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
