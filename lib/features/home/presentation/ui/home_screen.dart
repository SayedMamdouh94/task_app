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

    final categories = [
      'All',
      'Nature',
      'Animals',
      'Technology',
      'Travel',
      'Food',
      'Sports',
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
              categories: categories,
              onCategoryTap: (category) {
                // You can implement category filtering here
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Selected: $category')));
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
