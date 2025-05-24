import 'package:equatable/equatable.dart';

abstract class AlbumDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadPhotos extends AlbumDetailEvent {
  final int albumId;

  LoadPhotos(this.albumId);

  @override
  List<Object> get props => [albumId];
}
