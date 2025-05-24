import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/data_sources/album_api_service.dart';
import 'data/data_sources/photo_api_service.dart';
import 'data/repositories/album_repository_impl.dart';
import 'data/repositories/photo_repository_impl.dart';
import 'domain/usecases/fetch_albums_usecase.dart';
import 'domain/usecases/fetch_photos_by_album_usecase.dart';
import 'presentation/blocs/album_bloc.dart';
import 'presentation/blocs/album_detail_bloc.dart';
import 'presentation/blocs/album_event.dart';
import 'routes/app_router.dart';

void main() {
  final albumApiService = AlbumApiService();
  final photoApiService = PhotoApiService();

  final albumRepo = AlbumRepositoryImpl(albumApiService);
  final photoRepo = PhotoRepositoryImpl(photoApiService);

  final fetchAlbums = FetchAlbums(albumRepo);
  final fetchPhotosByAlbum = FetchPhotosByAlbum(photoRepo);

  runApp(MyApp(
    fetchAlbums: fetchAlbums,
    fetchPhotosByAlbum: fetchPhotosByAlbum,
  ));
}

class MyApp extends StatelessWidget {
  final FetchAlbums fetchAlbums;
  final FetchPhotosByAlbum fetchPhotosByAlbum;

  const MyApp({
    Key? key,
    required this.fetchAlbums,
    required this.fetchPhotosByAlbum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AlbumBloc(fetchAlbums)..add(LoadAlbums()),
        ),
        BlocProvider(
          create: (_) => AlbumDetailBloc(fetchPhotosByAlbum),
        ),
      ],
      child: MaterialApp.router(
        title: 'Albums App',
        routerConfig: appRouter.router,
      ),
    );
  }
}
