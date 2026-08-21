import 'package:bewerbung_zollsoft/documents/pages/documents_page.dart';
import 'package:bewerbung_zollsoft/documents/widgets/document_filter_chips_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DocumentsPage renders filter chips and reacts to selection',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DocumentsPage(),
        ),
      ),
    );

    expect(find.byType(DocumentFilterChipsWidget), findsOneWidget);
    expect(find.textContaining('Alle'), findsOneWidget);
    expect(find.textContaining('Arbeitszeugnisse'), findsOneWidget);

    // Tap on Arbeitszeugnisse chip
    await tester.tap(find.textContaining('Arbeitszeugnisse'));
    await tester.pumpAndSettle();

    expect(find.text('Aladin Music-Hall'), findsOneWidget);
  });
}
