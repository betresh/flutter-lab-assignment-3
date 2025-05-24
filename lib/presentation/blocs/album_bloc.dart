import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../domain/usecases/fetch_albums_usecase.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final FetchAlbums fetchAlbums;

  AlbumBloc(this.fetchAlbums) : super(AlbumLoading()) {
    on<LoadAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError('Failed to fetch albums'));
      }
    });
  }
}
