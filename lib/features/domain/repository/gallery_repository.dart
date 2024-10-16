import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

import '../../../core/resources/data_state.dart';

abstract class GalleryRepository {

  // API Methods

  Future<DataState<GalleryEntity>> getPhotosByQuery(String query,String perPage);



}