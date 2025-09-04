import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/features/home/presentation/widgets/loading_widget.dart';
import 'package:task_app/features/home/presentation/widgets/empty_state_widget.dart';

void main() {
  group('Separated Widgets Tests', () {
    testWidgets('LoadingWidget displays CircularProgressIndicator', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LoadingWidget())),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('EmptyStateWidget displays message and icon', (tester) async {
      const testMessage = 'No items found';
      const testIcon = Icons.search_off;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EmptyStateWidget(message: testMessage, icon: testIcon),
          ),
        ),
      );

      expect(find.text(testMessage), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
    });
  });
}
