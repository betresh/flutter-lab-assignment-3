
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/album_list_screen.dart';
import '../presentation/screens/album_detail_screen.dart';
import '../presentation/blocs/album_detail_bloc.dart';
import '../domain/usecases/fetch_photos_by_album_usecase.dart';
class AppRouter {
  final GoRouter router;

  AppRouter() : router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => AlbumListScreen(),
      ),
      GoRoute(
        path: '/album/:id',
        builder: (context, state) {
          final albumId = int.parse(state.pathParameters['id']!);
          final albumTitle = state.extra != null ? (state.extra as Map)['title'] as String : 'Unknown';
          final userId = state.extra != null ? (state.extra as Map)['userId'] as int : 0;

          return AlbumDetailScreen(
            albumId: albumId,
            albumTitle: albumTitle,
            userId: userId,
          );
        },
      ),
    ],
  );
}
