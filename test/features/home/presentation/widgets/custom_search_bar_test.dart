import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/features/home/presentation/widgets/custom_search_bar.dart';

void main() {
  group('CustomSearchBar Widget Tests', () {
    testWidgets('should render search bar with hint text', (tester) async {
      // Arrange
      const hintText = 'Search photos...';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar(
              hintText: hintText,
              onChanged: (query) {
                // Test callback - no need to store value
              },
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(hintText), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should call onChanged when text is entered', (tester) async {
      // Arrange
      String? searchQuery;
      const testQuery = 'test search';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSearchBar(onChanged: (query) => searchQuery = query),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextField), testQuery);

      // Assert
      expect(searchQuery, equals(testQuery));
    });

    testWidgets('should have proper decoration and styling', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CustomSearchBar(onChanged: (_) {})),
        ),
      );

      // Assert
      final container = find.byType(Container).first;
      expect(container, findsOneWidget);

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      final textFieldWidget = tester.widget<TextField>(textField);
      expect(textFieldWidget.decoration?.prefixIcon, isA<Icon>());
      expect(textFieldWidget.decoration?.border, isA<InputBorder>());
    });
  });
}
