// This file contains basic app tests for the Photo Gallery application.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/main.dart';

void main() {
  testWidgets('App should launch without errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for any initial animations or navigation
    await tester.pump();

    // Verify that the app launched successfully
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
