// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:online_service_app/main.dart';

void main() {
  testWidgets('Test for UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that landed on HomePage.
    expect(find.byIcon(Icons.home), findsOneWidget);
    // tap on home button should go to swiggyPage
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Verify that we are on swiggyPage.
    expect(find.byKey(ValueKey("SwiggyPage")), findsOneWidget);
  });
}
