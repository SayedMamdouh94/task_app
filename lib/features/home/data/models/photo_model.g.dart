// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
  id: (json['id'] as num).toInt(),
  albumId: (json['albumId'] as num).toInt(),
  title: json['title'] as String,
  url: json['url'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String,
);
