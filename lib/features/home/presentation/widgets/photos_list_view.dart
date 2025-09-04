import 'package:flutter/material.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/presentation/widgets/photo_list_item.dart';
import 'package:task_app/features/home/presentation/widgets/empty_state_widget.dart';

class PhotosListView extends StatelessWidget {
  final List<PhotoEntity> photos;

  const PhotosListView({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) {
      return const EmptyStateWidget(
        message: 'No photos found',
        icon: Icons.search_off,
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return PhotoListItem(photo: photos[index]);
      },
    );
  }
}
