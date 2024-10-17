
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/core/constants/constants.dart';
import '../../../../domain/entities/nasa_article_entity.dart';
part 'nasa_article_api_service.g.dart';

@RestApi(baseUrl: apodBaseUrl)
abstract class NasaArticleApiService {
  factory NasaArticleApiService(Dio dio) = _NasaArticleApiService;

  
  @GET("")
  Future<HttpResponse<NasaArticleEntity>> getNasaArticles({
    @Query("api_key") String ? api_key,
    @Query("date") String? date
  });


}

