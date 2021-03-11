// This is a basic Flutter integration test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('testing `OnBoardingScreen` widget', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    sleep(Duration(seconds: 3));

    await tester.drag(
        find.text('Developer Student Club'), const Offset(-300, 0.0));
    await tester.pumpAndSettle();

    sleep(Duration(seconds: 3));

    await tester.drag(
        find.text('Developer Student Club'), const Offset(-300, 0.0));
    await tester.pumpAndSettle();

    sleep(Duration(seconds: 3));

    await tester.drag(
        find.text('Developer Student Club'), const Offset(-300, 0.0));
    await tester.pumpAndSettle();

    sleep(Duration(seconds: 3));

    await tester.drag(
        find.text('Developer Student Club'), const Offset(-300, 0.0));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('get_started')), findsOneWidget);
  });
}
