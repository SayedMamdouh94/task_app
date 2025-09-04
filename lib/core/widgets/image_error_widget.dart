import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  final String? originalUrl;
  final double? height;
  final String? message;

  const ImageErrorWidget({
    super.key,
    this.originalUrl,
    this.height,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image, color: Colors.grey[600], size: 50),
          const SizedBox(height: 8),
          Text(
            message ?? 'Image not available',
            style: TextStyle(color: Colors.grey[600]),
          ),
          if (originalUrl != null) ...[
            const SizedBox(height: 4),
            Text(
              'Original: ${originalUrl!.split('/').last}',
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
