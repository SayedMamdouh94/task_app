import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';

class PhotoDetails extends StatelessWidget {
  final PhotoEntity photo;

  const PhotoDetails({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            photo.title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                Icons.photo,
                size: 16.w,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              SizedBox(width: 4.w),
              Text(
                'Photo #${photo.id}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
