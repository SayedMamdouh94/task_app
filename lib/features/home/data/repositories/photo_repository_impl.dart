import 'package:task_app/core/networking/data_result.dart';
import 'package:task_app/features/home/data/datasources/photo_api_service.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApiService _apiService;

  const PhotoRepositoryImpl(this._apiService);

  @override
  Future<DataResult<List<PhotoEntity>>> getPhotos({int limit = 100}) async {
    try {
      final photos = await _apiService.getPhotos(limit: limit);
      return DataResult.success(photos);
    } catch (e) {
      return DataResult.error(e.toString());
    }
  }
}
