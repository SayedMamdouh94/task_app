import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/presentation/widgets/photo_image.dart';
import 'package:task_app/features/home/presentation/widgets/photo_details.dart';

class PhotoListItem extends StatelessWidget {
  final PhotoEntity photo;

  const PhotoListItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoImage(
            url: photo.url,
            aspectRatio: 16 / 9,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          ),
          PhotoDetails(photo: photo),
        ],
      ),
    );
  }
}
