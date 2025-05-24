import 'package:album/domain/entities/album.dart';
import 'package:album/domain/repositories/album_repository.dart';
import 'package:album/domain/usecases/fetch_albums_usecase.dart';

class FakeAlbumRepository implements AlbumRepository {
  @override
  Future<List<Album>> getAlbums() async {
    return <Album>[];
  }
}

class FakeFetchAlbums extends FetchAlbums {
  FakeFetchAlbums() : super(FakeAlbumRepository());

  @override
  Future<List<Album>> call() async {
    return <Album>[];
  }
}
