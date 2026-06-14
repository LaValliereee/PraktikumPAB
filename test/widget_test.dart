import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:prak_pba/main.dart';

void main() {
  testWidgets('register saves profile and shows profile data', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Daftar'), findsOneWidget);

    await tester.enterText(find.byType(EditableText).at(0), 'Budi Santoso');
    await tester.enterText(find.byType(EditableText).at(1), '1462300001');
    await tester.enterText(find.byType(EditableText).at(2), '1234');
    await tester.enterText(find.byType(EditableText).at(3), 'budi@example.com');
    await tester.enterText(find.byType(EditableText).at(4), 'Surabaya');
    await tester.enterText(find.byType(EditableText).at(5), '@budi');
    await tester.ensureVisible(find.text('Daftar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Daftar'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to'), findsOneWidget);
    expect(find.text('Budi Santoso'), findsOneWidget);
    expect(find.text('1462300001'), findsOneWidget);

    await tester.ensureVisible(find.text('Masuk'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    expect(find.text('budi@example.com'), findsOneWidget);
    expect(find.text('Surabaya'), findsOneWidget);
    expect(find.text('@budi'), findsOneWidget);
  });
}
