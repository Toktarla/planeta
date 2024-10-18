import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/core/resources/usecase.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/gallery_repository.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

class GetPhotosByQueryUseCase implements UseCase<DataState<GalleryEntity>, List<String>>{


  final GalleryRepository _galleryRepository;

  GetPhotosByQueryUseCase(this._galleryRepository);

  @override
  Future<DataState<GalleryEntity>> call({List<String>? params}) {
    return _galleryRepository.getPhotosByQuery(params![0],params[1]);
  }




}