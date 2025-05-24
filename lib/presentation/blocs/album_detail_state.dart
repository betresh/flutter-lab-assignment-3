import 'package:equatable/equatable.dart';
import '../../domain/entities/photo.dart';

abstract class AlbumDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumDetailLoading extends AlbumDetailState {}

class AlbumDetailLoaded extends AlbumDetailState {
  final List<Photo> photos;

  AlbumDetailLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class AlbumDetailError extends AlbumDetailState {
  final String message;

  AlbumDetailError(this.message);

  @override
  List<Object> get props => [message];
}
