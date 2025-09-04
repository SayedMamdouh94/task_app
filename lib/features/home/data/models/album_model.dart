import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/features/home/domain/entities/album_entity.dart';

part 'album_model.g.dart';

@JsonSerializable(createToJson: false)
class AlbumModel {
  final int userId;
  final int id;
  final String title;

  const AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}

extension AlbumModelX on AlbumModel {
  AlbumEntity toEntity() => AlbumEntity(userId: userId, id: id, title: title);
}
