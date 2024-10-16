import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:floor/floor.dart';
import 'package:untitled/features/data/data_sources/local/DAO/planet_dao.dart';
import 'package:untitled/features/data/models/nasa_article_model.dart';
import 'package:untitled/features/data/models/planet_model.dart';

import 'DAO/nasa_article_dao.dart';
part 'app_database.g.dart';

@Database(version: 3, entities: [NasaArticleModel,PlanetModel])
abstract class AppDatabase extends FloorDatabase {
  NasaArticleDao get nasaArticleDAO;
  PlanetDAO get planetDAO;

  static final migration1to3 = [Migration(1, 3, (database) async {
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `planets` (`name` TEXT, `description` TEXT, `image_url` TEXT, `planetType` TEXT, `explanation` TEXT, `whatis` TEXT, PRIMARY KEY (`name`))'

    );
  })];

}