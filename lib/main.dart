import 'package:bewerbung_zollsoft/hello_zollsoft/provider/theme_provider.dart';
import 'package:bewerbung_zollsoft/routing_navigation/provider/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: ZollsoftBewerbung()));

class ZollsoftBewerbung extends ConsumerWidget {
  const ZollsoftBewerbung({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Fynn Gerdes | Bewerbung als Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider(brightness: Brightness.light)),
      darkTheme: ref.watch(themeProvider(brightness: Brightness.dark)),
      themeMode: ref.watch(switchThemeModeProvider),
      routerConfig: router,
    );
  }
}
