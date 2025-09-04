import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/di/dependency_injection.dart';
import 'package:task_app/features/home/presentation/cubit/photo_cubit.dart';
import 'package:task_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:task_app/features/home/presentation/widgets/featured_carousel.dart';
import 'package:task_app/features/home/presentation/widgets/horizontal_categories_list.dart';
import 'package:task_app/features/home/presentation/widgets/photos_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PhotoCubit>()..getPhotos(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredImages = [
      'https://picsum.photos/800/400?random=1',
      'https://picsum.photos/800/400?random=2',
      'https://picsum.photos/800/400?random=3',
      'https://picsum.photos/800/400?random=4',
    ];

    // Album-based categories (using real albumIds from JSONPlaceholder)
    final categories = <Map<String, dynamic>>[
      {'id': null, 'name': 'All', 'albumId': null},
      {'id': 'album1', 'name': 'Album 1', 'albumId': 1},
      {'id': 'album2', 'name': 'Album 2', 'albumId': 2},
      {'id': 'album3', 'name': 'Album 3', 'albumId': 3},
      {'id': 'album4', 'name': 'Album 4', 'albumId': 4},
      {'id': 'album5', 'name': 'Album 5', 'albumId': 5},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              onChanged: (query) {
                context.read<PhotoCubit>().searchPhotos(query);
              },
            ),
            FeaturedCarousel(imageUrls: featuredImages),
            HorizontalCategoriesList(
              categories: categories
                  .map((cat) => cat['name'] as String)
                  .toList(),
              onCategoryTap: (categoryName) {
                // Find the selected category and filter by albumId
                final selectedCategory = categories.firstWhere(
                  (cat) => cat['name'] == categoryName,
                );
                final albumId = selectedCategory['albumId'] as int?;
                context.read<PhotoCubit>().filterByAlbum(albumId);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      albumId == null
                          ? 'Showing all photos'
                          : 'Filtered by $categoryName (Album $albumId)',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent Photos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const PhotosList(),
          ],
        ),
      ),
    );
  }
}
