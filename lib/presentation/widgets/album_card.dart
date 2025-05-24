import 'package:flutter/material.dart';
import '../../domain/entities/album.dart';
import 'package:go_router/go_router.dart';

class AlbumTile extends StatelessWidget {
  final Album album;

  AlbumTile({required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      onTap: () {
        context.push('/details', extra: album);
      },
    );
  }
}
