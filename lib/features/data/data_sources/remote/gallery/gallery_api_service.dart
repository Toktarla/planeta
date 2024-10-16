
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
part 'gallery_api_service.g.dart';


@RestApi(baseUrl: "https://api.unsplash.com")
abstract class GalleryApiService {
  factory GalleryApiService(Dio dio) = _GalleryApiService;


  @GET("/search/photos")
  Future<HttpResponse<GalleryEntity>> getPhotosByQuery({
    @Query("client_id") String ? client_id,
    @Query("query") String? query,
    @Query("per_page") String? per_page,

  });


}

