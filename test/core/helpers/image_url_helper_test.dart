import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/core/helpers/image_url_helper.dart';

void main() {
  group('ImageUrlHelper', () {
    test(
      'should transform via.placeholder.com URL to placehold.co PNG URL',
      () {
        // Arrange
        const originalUrl = 'https://via.placeholder.com/600/92c952';
        const expectedUrl = 'https://placehold.co/600x400/92c952/fff.png';

        // Act
        final result = ImageUrlHelper.getWorkingImageUrl(originalUrl);

        // Assert
        expect(result, equals(expectedUrl));
      },
    );

    test(
      'should transform via.placeholder.com URL with different dimensions',
      () {
        // Arrange
        const originalUrl = 'https://via.placeholder.com/150/771796';
        const expectedUrl = 'https://placehold.co/150x400/771796/fff.png';

        // Act
        final result = ImageUrlHelper.getWorkingImageUrl(originalUrl);

        // Assert
        expect(result, equals(expectedUrl));
      },
    );

    test('should return original URL for non-via.placeholder.com URLs', () {
      // Arrange
      const originalUrl = 'https://example.com/image.jpg';

      // Act
      final result = ImageUrlHelper.getWorkingImageUrl(originalUrl);

      // Assert
      expect(result, equals(originalUrl));
    });

    test('should handle via.placeholder.com URL without color', () {
      // Arrange
      const originalUrl = 'https://via.placeholder.com/600';
      const expectedUrl = 'https://placehold.co/600x400/3498db/fff.png';

      // Act
      final result = ImageUrlHelper.getWorkingImageUrl(originalUrl);

      // Assert
      expect(result, equals(expectedUrl));
    });
  });
}
