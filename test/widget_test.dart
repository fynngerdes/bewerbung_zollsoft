import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewerbung_zollsoft/main.dart';

void main() {
  testWidgets('App renders successfully and displays main elements', (WidgetTester tester) async {
    // Build our app under ProviderScope and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: ZollsoftBewerbung(),
      ),
    );

    // Verify that the initial page renders the profile name and current screen title.
    expect(find.text('Fynn Gerdes'), findsOneWidget);
    expect(find.text('Hallo Zollsoft!'), findsAtLeastNWidgets(1));
  });
}
