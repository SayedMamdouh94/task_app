import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/networking/data_result.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';
import 'package:task_app/features/home/domain/usecases/get_photos_usecase.dart';
import 'package:task_app/features/home/presentation/cubit/photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  final GetPhotosUseCase _getPhotosUseCase;

  PhotoCubit(this._getPhotosUseCase) : super(const PhotoInitial());

  Future<void> getPhotos() async {
    if (isClosed) return;
    emit(const PhotoLoading());

    final result = await _getPhotosUseCase();

    if (isClosed) return;
    switch (result) {
      case Success<List<PhotoEntity>>():
        emit(PhotoSuccess(photos: result.data, filteredPhotos: result.data));
      case Error<List<PhotoEntity>>():
        emit(PhotoError(result.message));
    }
  }

  void searchPhotos(String query) {
    if (isClosed) return;
    final currentState = state;
    if (currentState is PhotoSuccess) {
      if (query.isEmpty) {
        emit(currentState.copyWith(filteredPhotos: currentState.photos));
      } else {
        final filteredPhotos = currentState.photos
            .where(
              (photo) =>
                  photo.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        emit(currentState.copyWith(filteredPhotos: filteredPhotos));
      }
    }
  }

  void filterByAlbum(int? albumId) {
    if (isClosed) return;
    final currentState = state;
    if (currentState is PhotoSuccess) {
      if (albumId == null) {
        // Show all photos
        emit(currentState.copyWith(filteredPhotos: currentState.photos));
      } else {
        // Filter by album ID
        final filteredPhotos = currentState.photos
            .where((photo) => photo.albumId == albumId)
            .toList();
        emit(currentState.copyWith(filteredPhotos: filteredPhotos));
      }
    }
  }
}
