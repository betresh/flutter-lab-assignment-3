import '../../domain/entities/album.dart';
import '../../domain/repositories/album_repository.dart';
import '../data_sources/album_api_service.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumApiService apiService;

  AlbumRepositoryImpl(this.apiService);

  @override
  Future<List<Album>> getAlbums() async {
    return await apiService.fetchAlbums();
  }
}
