import 'package:equatable/equatable.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';

sealed class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object?> get props => [];
}

class PhotoInitial extends PhotoState {
  const PhotoInitial();
}

class PhotoLoading extends PhotoState {
  const PhotoLoading();
}

class PhotoSuccess extends PhotoState {
  final List<PhotoEntity> photos;
  final List<PhotoEntity> filteredPhotos;

  const PhotoSuccess({required this.photos, required this.filteredPhotos});

  @override
  List<Object?> get props => [photos, filteredPhotos];

  PhotoSuccess copyWith({
    List<PhotoEntity>? photos,
    List<PhotoEntity>? filteredPhotos,
  }) {
    return PhotoSuccess(
      photos: photos ?? this.photos,
      filteredPhotos: filteredPhotos ?? this.filteredPhotos,
    );
  }
}

class PhotoError extends PhotoState {
  final String message;

  const PhotoError(this.message);

  @override
  List<Object?> get props => [message];
}
