import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/home/presentation/cubit/photo_cubit.dart';
import 'package:task_app/features/home/presentation/cubit/photo_state.dart';
import 'package:task_app/features/home/presentation/widgets/loading_widget.dart';
import 'package:task_app/features/home/presentation/widgets/photo_error_widget.dart';
import 'package:task_app/features/home/presentation/widgets/empty_state_widget.dart';
import 'package:task_app/features/home/presentation/widgets/photos_list_view.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        switch (state) {
          case PhotoInitial():
            return const EmptyStateWidget(
              message: 'Tap to load photos',
              icon: Icons.photo_library_outlined,
            );
          case PhotoLoading():
            return const LoadingWidget();
          case PhotoSuccess():
            return PhotosListView(photos: state.filteredPhotos);
          case PhotoError():
            return PhotoErrorWidget(message: state.message);
        }
      },
    );
  }
}
