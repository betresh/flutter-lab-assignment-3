import '../entities/photo.dart';
import '../repositories/photo_repository.dart';

class FetchPhotosByAlbum {
  final PhotoRepository repository;

  FetchPhotosByAlbum(this.repository);

  Future<List<Photo>> call(int albumId) async {
    return await repository.getPhotosByAlbumId(albumId);
  }
}
