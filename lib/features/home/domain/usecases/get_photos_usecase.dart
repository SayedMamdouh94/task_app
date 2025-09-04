import 'package:task_app/core/networking/data_result.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/domain/repositories/photo_repository.dart';

class GetPhotosUseCase {
  final PhotoRepository _repository;

  const GetPhotosUseCase(this._repository);

  Future<DataResult<List<PhotoEntity>>> call({int limit = 100}) async {
    return await _repository.getPhotos(limit: limit);
  }
}
