import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/features/home/domain/entities/photo_entity.dart';

part 'photo_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required super.id,
    required super.albumId,
    required super.title,
    required super.url,
    required super.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
