import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

abstract class RemoteGalleryState extends Equatable {
  final GalleryEntity ? galleryEntity;
  final DioException ? error;

  const RemoteGalleryState({this.galleryEntity,this.error});

  @override
  List<Object> get props => [galleryEntity!, error!];
}

class RemoteGalleryLaunching extends RemoteGalleryState {
  const RemoteGalleryLaunching();
}

class RemoteGalleryLoading extends RemoteGalleryState {
  const RemoteGalleryLoading();
}

class RemoteGalleryDone extends RemoteGalleryState {
  const RemoteGalleryDone(GalleryEntity galleryEntity) : super(galleryEntity: galleryEntity);
}

class RemoteGalleryError extends RemoteGalleryState {
  const RemoteGalleryError(DioException error) : super(error: error);
}