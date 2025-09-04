import 'package:flutter/material.dart';

class ImageLoadingWidget extends StatelessWidget {
  final ImageChunkEvent? loadingProgress;

  const ImageLoadingWidget({super.key, this.loadingProgress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress?.expectedTotalBytes != null
            ? loadingProgress!.cumulativeBytesLoaded /
                  loadingProgress!.expectedTotalBytes!
            : null,
      ),
    );
  }
}
