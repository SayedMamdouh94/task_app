import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:task_app/core/networking/data_result.dart';
import 'package:task_app/features/home/data/datasources/photo_api_service.dart';
import 'package:task_app/features/home/data/models/photo_model.dart';
import 'package:task_app/features/home/data/repositories/photo_repository_impl.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';

import 'photo_repository_test.mocks.dart';

@GenerateMocks([PhotoApiService])
void main() {
  late PhotoRepositoryImpl repository;
  late MockPhotoApiService mockApiService;

  setUp(() {
    mockApiService = MockPhotoApiService();
    repository = PhotoRepositoryImpl(mockApiService);
  });

  group('PhotoRepositoryImpl', () {
    const tPhotoModels = [
      PhotoModel(
        id: 1,
        albumId: 1,
        title: 'Test Photo',
        url: 'https://example.com/photo.jpg',
        thumbnailUrl: 'https://example.com/thumb.jpg',
      ),
    ];

    test('should return success result when API call is successful', () async {
      // Arrange
      when(
        mockApiService.getPhotos(limit: anyNamed('limit')),
      ).thenAnswer((_) async => tPhotoModels);

      // Act
      final result = await repository.getPhotos(limit: 10);

      // Assert
      expect(result, isA<Success<List<PhotoEntity>>>());
      verify(mockApiService.getPhotos(limit: 10));
      verifyNoMoreInteractions(mockApiService);
    });

    test('should return error result when API call throws exception', () async {
      // Arrange
      when(
        mockApiService.getPhotos(limit: anyNamed('limit')),
      ).thenThrow(Exception('API Error'));

      // Act
      final result = await repository.getPhotos(limit: 10);

      // Assert
      expect(result, isA<Error<List<PhotoEntity>>>());
      verify(mockApiService.getPhotos(limit: 10));
      verifyNoMoreInteractions(mockApiService);
    });
  });
}
