import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_detail_event.dart';
import 'album_detail_state.dart';
import '../../domain/usecases/fetch_photos_by_album_usecase.dart';

class AlbumDetailBloc extends Bloc<AlbumDetailEvent, AlbumDetailState> {
  final FetchPhotosByAlbum fetchPhotosByAlbum;

  AlbumDetailBloc(this.fetchPhotosByAlbum) : super(AlbumDetailLoading()) {
    on<LoadPhotos>((event, emit) async {
      emit(AlbumDetailLoading());
      try {
        final photos = await fetchPhotosByAlbum(event.albumId);
        emit(AlbumDetailLoaded(photos));
      } catch (e) {
        emit(AlbumDetailError('Failed to load photos'));
      }
    });
  }
}
