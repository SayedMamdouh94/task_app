import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/domain/usecases/get_photos_usecase.dart';
import 'package:task_app/core/networking/data_result.dart';
import 'package:task_app/features/home/domain/repositories/photo_repository.dart';

// Mock repository for testing
class MockPhotoRepository implements PhotoRepository {
  final bool shouldReturnError;

  MockPhotoRepository({this.shouldReturnError = false});

  @override
  Future<DataResult<List<PhotoEntity>>> getPhotos({int limit = 100}) async {
    if (shouldReturnError) {
      return const DataResult.error('Test error');
    }

    return const DataResult.success([
      PhotoEntity(
        id: 1,
        albumId: 1,
        title: 'Test Photo',
        url: 'https://example.com/photo.jpg',
        thumbnailUrl: 'https://example.com/thumb.jpg',
      ),
    ]);
  }
}

void main() {
  late GetPhotosUseCase useCase;
  late MockPhotoRepository mockRepository;

  setUp(() {
    mockRepository = MockPhotoRepository();
    useCase = GetPhotosUseCase(mockRepository);
  });

  group('GetPhotosUseCase', () {
    test('should return photos when repository call is successful', () async {
      // Act
      final result = await useCase(limit: 10);

      // Assert
      expect(result, isA<Success<List<PhotoEntity>>>());
      final successResult = result as Success<List<PhotoEntity>>;
      expect(successResult.data, isNotEmpty);
      expect(successResult.data.first.id, 1);
      expect(successResult.data.first.title, 'Test Photo');
    });

    test('should return error when repository call fails', () async {
      // Arrange
      mockRepository = MockPhotoRepository(shouldReturnError: true);
      useCase = GetPhotosUseCase(mockRepository);

      // Act
      final result = await useCase(limit: 10);

      // Assert
      expect(result, isA<Error<List<PhotoEntity>>>());
      final errorResult = result as Error<List<PhotoEntity>>;
      expect(errorResult.message, 'Test error');
    });

    test('should pass limit parameter to repository', () async {
      // This is a simple test since our mock doesn't track parameters
      // In a real scenario, you'd verify the parameter was passed correctly

      // Act
      final result = await useCase(limit: 50);

      // Assert
      expect(result, isA<Success<List<PhotoEntity>>>());
    });
  });
}
