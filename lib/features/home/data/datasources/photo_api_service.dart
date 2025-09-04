import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_app/core/networking/api_constants.dart';
import 'package:task_app/features/home/data/models/photo_model.dart';
import 'package:task_app/features/home/data/models/album_model.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio, {String baseUrl}) = _PhotoApiService;

  @GET(ApiConstants.photos)
  Future<List<PhotoModel>> getPhotos({@Query('_limit') int limit = 100});

  @GET(ApiConstants.albums)
  Future<List<AlbumModel>> getAlbums({@Query('_limit') int limit = 10});

  @GET(ApiConstants.photos)
  Future<List<PhotoModel>> getPhotosByAlbum({
    @Query('albumId') required int albumId,
    @Query('_limit') int limit = 50,
  });
}
