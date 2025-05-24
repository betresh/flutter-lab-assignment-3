import '../entities/album.dart';
import '../repositories/album_repository.dart';

class FetchAlbums {
  final AlbumRepository repository;

  FetchAlbums(this.repository);

  Future<List<Album>> call() async {
    return await repository.getAlbums();
  }
}
