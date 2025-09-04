import 'package:flutter/material.dart';
import 'package:task_app/core/helpers/image_url_helper.dart';
import 'package:task_app/core/widgets/image_loading_widget.dart';
import 'package:task_app/core/widgets/image_error_widget.dart';

class PhotoImage extends StatelessWidget {
  final String url;
  final double aspectRatio;
  final BorderRadius? borderRadius;

  const PhotoImage({
    super.key,
    required this.url,
    this.aspectRatio = 16 / 9,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final workingUrl = ImageUrlHelper.getWorkingImageUrl(url);
    final radius =
        borderRadius ?? const BorderRadius.vertical(top: Radius.circular(12));

    return ClipRRect(
      borderRadius: radius,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: _buildImageWidget(workingUrl),
      ),
    );
  }

  Widget _buildImageWidget(String imageUrl) {
    // Use Image.network for all URLs since placehold.co SVG has parsing issues
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return ImageLoadingWidget(loadingProgress: loadingProgress);
      },
      errorBuilder: (context, error, stackTrace) {
        // For any error, show the error widget
        return ImageErrorWidget(originalUrl: url);
      },
    );
  }
}
