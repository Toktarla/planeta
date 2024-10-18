import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/data/data_sources/remote/people_in_space_service.dart';
import 'package:untitled/features/data/data_sources/remote/gallery/gallery_api_service.dart';
import 'package:untitled/features/data/data_sources/remote/nasa_article/nasa_article_api_service.dart';
import 'package:untitled/features/data/repository/gallery_repository_impl.dart';
import 'package:untitled/features/data/repository/nasa_article_repository_impl.dart';
import 'package:untitled/features/data/repository/planet_repository_impl.dart';
import 'package:untitled/features/domain/repository/gallery_repository.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';
import 'package:untitled/features/domain/usecases/gallery_usecases/get_photos_by_query_usecase.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/get_nasa_article_usecase.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/get_saved_nasa_articles_usecase.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/get_saved_planets_usecase.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/remove_planet_usecase.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/remove_nasa_article_usecase.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/save_nasa_article_usecase.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/local/local_nasa_article_bloc.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_bloc.dart';
import 'package:untitled/features/presentation/cubit/index_cubit.dart';
import 'package:untitled/features/presentation/cubit/localization_cubit.dart';
import 'package:untitled/features/presentation/cubit/theme_cubit.dart';

import 'features/data/data_sources/local/app_database.dart';
import 'features/domain/usecases/planet_usecases/save_planet_usecase.dart';
import 'features/presentation/bloc/gallery/remote/remote_gallery_bloc.dart';
import 'features/presentation/bloc/nasa_article/remote/remote_nasa_article_bloc.dart';
import 'features/presentation/cubit/data_cubit.dart';
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
    // Database
    final  database = await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations(AppDatabase.migration1to3).build();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Local Storage
    sl.registerSingleton<SharedPreferences>(prefs);
    sl.registerSingleton<AppDatabase>(database);

    // Dio
    sl.registerSingleton<Dio>(Dio());

    // Dependencies
    sl.registerSingleton<AstroApiService>(AstroApiService(sl()));
    sl.registerSingleton<NasaArticleApiService>(NasaArticleApiService(sl()));
    sl.registerSingleton<GalleryApiService>(GalleryApiService(sl()));

    sl.registerSingleton<NasaArticleRepository>(NasaArticleRepositoryImpl(sl(), sl()));
    sl.registerSingleton<PlanetRepository>(PlanetRepositoryImpl(sl()));
    sl.registerSingleton<GalleryRepository>(GalleryRepositoryImpl(sl()));

    //UseCases
    sl.registerSingleton<GetNasaArticlesUseCase>(
        GetNasaArticlesUseCase(sl())
    );

    sl.registerSingleton<GetSavedNasaArticlesUseCase>(
        GetSavedNasaArticlesUseCase(sl())
    );

    sl.registerSingleton<SaveNasaArticleUseCase>(
        SaveNasaArticleUseCase(sl())
    );

    sl.registerSingleton<RemoveNasaArticleUseCase>(
        RemoveNasaArticleUseCase(sl())
    );

    sl.registerSingleton<RemovePlanetUseCase>(
        RemovePlanetUseCase(sl())
    );

    sl.registerSingleton<SavePlanetUseCase>(
        SavePlanetUseCase(sl())
    );
    sl.registerSingleton<GetSavedPlanetsUseCase>(
        GetSavedPlanetsUseCase(sl())
    );

    sl.registerSingleton<GetPhotosByQueryUseCase>(GetPhotosByQueryUseCase(sl()));


    // Blocs

    sl.registerFactory<RemoteNasaArticleBloc>(
            ()=> RemoteNasaArticleBloc(sl())
    );

    sl.registerFactory<LocalNasaArticleBloc>(
            ()=> LocalNasaArticleBloc(sl(),sl(),sl())
    );

    sl.registerFactory<LocalPlanetBloc>(
            ()=> LocalPlanetBloc(sl(),sl(),sl())
    );

    sl.registerFactory<RemoteGalleryBloc>(
            ()=> RemoteGalleryBloc(sl())
    );


    // Cubits

    sl.registerFactory<IndexCubit>(
            ()=> IndexCubit()
    );

    sl.registerFactory<LocalizationCubit>(
            ()=> LocalizationCubit(sl())
    );

    sl.registerFactory<ThemeCubit>(
            ()=> ThemeCubit(sl())
    );


    sl.registerFactory<DataCubit>(
            ()=> DataCubit()
    );
}