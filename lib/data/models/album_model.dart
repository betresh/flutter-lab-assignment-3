import '../../domain/entities/album.dart';
// lib/domain/entities/entities.dart


class AlbumModel {
  final int userId;
  final int id;
  final String title;

  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  // Correct placement: inside the class
  Album toEntity() {
    return Album(
      userId: userId,
      id: id,
      title: title,
    );
  }
}
