import 'package:task_app/core/networking/data_result.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';

abstract class PhotoRepository {
  Future<DataResult<List<PhotoEntity>>> getPhotos({int limit = 100});
}
