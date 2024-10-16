import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/domain/usecases/gallery_usecases/get_photos_by_query_usecase.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_event.dart';
import 'package:untitled/features/presentation/bloc/gallery/remote/remote_gallery_state.dart';

import '../../../../domain/entities/gallery_entity.dart'; // import the singleton

class RemoteGalleryBloc extends Bloc<RemoteGalleryEvent, RemoteGalleryState> {
  final GetPhotosByQueryUseCase _getPhotosByQueryUseCase;
  final GalleryDataSingleton _galleryDataSingleton = GalleryDataSingleton();

  RemoteGalleryBloc(this._getPhotosByQueryUseCase) : super(const RemoteGalleryLaunching()) {
    on<GetPhotosByQueryEvent>(onGetPhotosByQueryEvent);
  }

  void onGetPhotosByQueryEvent(GetPhotosByQueryEvent event, Emitter<RemoteGalleryState> emit) async {
    if (_galleryDataSingleton.getGalleryEntity(event.query) != null) {
      emit(RemoteGalleryDone(_galleryDataSingleton.getGalleryEntity(event.query)!));
      return;
    }

    emit(const RemoteGalleryLoading());

    // Since the data hasn't been fetched, we proceed to make the request
    final dataState = await _getPhotosByQueryUseCase.call(params: [event.query, event.per_page]);

    if (dataState is DataSuccess && dataState.data != null) {
      _galleryDataSingleton.setGalleryEntity(event.query, dataState.data!);
      emit(RemoteGalleryDone(dataState.data!));
    } else if (dataState is DataFailure) {
      emit(RemoteGalleryError(dataState.error!));
    }
  }

}


class GalleryDataSingleton {
  static final GalleryDataSingleton _instance = GalleryDataSingleton._internal();

  factory GalleryDataSingleton() {
    return _instance;
  }

  GalleryDataSingleton._internal();

  Map<String, GalleryEntity> galleryEntities = {};

  void setGalleryEntity(String query, GalleryEntity entity) {
    galleryEntities[query] = entity;
  }

  GalleryEntity? getGalleryEntity(String query) {
    return galleryEntities[query];
  }
}
