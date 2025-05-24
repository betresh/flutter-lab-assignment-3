import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';
import '../data_sources/photo_api_service.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApiService apiService;

  PhotoRepositoryImpl(this.apiService);

  @override
  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    return await apiService.fetchPhotosByAlbumId(albumId);
  }
}
