import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  final int userId;
  final int id;
  final String title;

  const AlbumEntity({
    required this.userId,
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [userId, id, title];
}
