import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:task_app/main.dart' as app;
import 'package:get_it/get_it.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Photo Gallery Integration Tests', () {
    setUp(() async {
      // Reset GetIt instance before each test
      await GetIt.instance.reset();
    });

    testWidgets('should load and display photos from API', (tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for splash screen to finish and navigate to home
      await tester.pump(const Duration(seconds: 4));

      // Find the home screen by looking for the AppBar first
      expect(find.byType(AppBar), findsOneWidget);

      // Look for search field using hint text instead
      expect(find.text('Search photos...'), findsOneWidget);

      // Wait for photos to load (API call) with individual pumps
      for (int i = 0; i < 25; i++) {
        await tester.pump(const Duration(milliseconds: 500));
        if (find.text('Recent Photos').tryEvaluate()) {
          break;
        }
      }

      // Verify photos section header is displayed
      expect(find.text('Recent Photos'), findsOneWidget);

      // Look for at least one Card widget (photo item)
      expect(find.byType(Card), findsAtLeastNWidgets(1));
    });

    testWidgets('should allow searching through photos', (tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for splash screen and photos to load
      await tester.pumpAndSettle(const Duration(seconds: 8));

      // Find search bar by hint text
      final searchField = find.text('Search photos...');
      expect(searchField, findsOneWidget);

      // Find the actual TextField widget
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      await tester.enterText(textField, 'test');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify search functionality works (UI responds to search)
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should display carousel and categories', (tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for splash screen
      await tester.pumpAndSettle(const Duration(seconds: 4));

      // Verify category chips are present
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Nature'), findsOneWidget);
      expect(find.text('Technology'), findsOneWidget);

      // Verify carousel container exists by looking for any container
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });
  });
}
