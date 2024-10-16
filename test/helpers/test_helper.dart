import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:untitled/features/data/data_sources/local/DAO/nasa_article_dao.dart';
import 'package:untitled/features/data/data_sources/local/DAO/planet_dao.dart';
import 'package:untitled/features/data/data_sources/local/app_database.dart';
import 'package:untitled/features/data/data_sources/remote/gallery/gallery_api_service.dart';
import 'package:untitled/features/data/data_sources/remote/nasa_article/nasa_article_api_service.dart';
import 'package:untitled/features/data/data_sources/remote/people_in_space_service.dart';
import 'package:untitled/features/domain/repository/gallery_repository.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/get_nasa_article_usecase.dart';

@GenerateMocks([
  NasaArticleRepository,
  GalleryRepository,
  PlanetRepository,
  NasaArticleApiService,
  AppDatabase,
  GalleryApiService,
  PlanetDAO,
  NasaArticleDao,
  GetNasaArticlesUseCase,
  AstroApiService

],
  customMocks: [MockSpec<Dio>(as: #MockDio)]
)
void main() {}
