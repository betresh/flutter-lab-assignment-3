import '../entities/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotosByAlbumId(int albumId);
}
