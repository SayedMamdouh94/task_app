import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/presentation/cubit/photo_cubit.dart';
import 'package:task_app/features/home/presentation/cubit/photo_state.dart';
import 'package:task_app/features/home/presentation/widgets/photo_list_item.dart';

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
            return ErrorWidget(message: state.message);
        }
      },
    );
  }
}

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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;

  const ErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading photos',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<PhotoCubit>().getPhotos(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
