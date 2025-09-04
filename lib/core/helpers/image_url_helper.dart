class ImageUrlHelper {
  ImageUrlHelper._();

  /// Transforms broken placeholder URLs to working image URLs
  static String getWorkingImageUrl(String originalUrl) {
    // Transform via.placeholder.com URLs to working image URLs
    if (originalUrl.contains('via.placeholder.com')) {
      // Extract from URLs like: https://via.placeholder.com/600/92c952
      final regex = RegExp(r'via\.placeholder\.com/(\d+)(?:/([a-fA-F0-9]+))?');
      final match = regex.firstMatch(originalUrl);

      if (match != null) {
        final width = match.group(1) ?? '600'; // Default width
        final color = match.group(2) ?? '3498db'; // Default color

        // Use placehold.co with PNG format to avoid SVG parsing issues
        final transformedUrl =
            'https://placehold.co/${width}x400/$color/fff.png';

        return transformedUrl;
      }
    }

    // Return original URL if it's not a via.placeholder.com URL
    return originalUrl;
  }
}
