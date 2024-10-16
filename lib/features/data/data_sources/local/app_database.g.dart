// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NasaArticleDao? _nasaArticleDAOInstance;

  PlanetDAO? _planetDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `nasaArticle` (`title` TEXT, `hdurl` TEXT, `date` TEXT, `explanation` TEXT, `copyright` TEXT, PRIMARY KEY (`title`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `planets` (`name` TEXT, `description` TEXT, `image_url` TEXT, `planetType` TEXT, `explanation` TEXT, `whatis` TEXT, PRIMARY KEY (`name`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NasaArticleDao get nasaArticleDAO {
    return _nasaArticleDAOInstance ??=
        _$NasaArticleDao(database, changeListener);
  }

  @override
  PlanetDAO get planetDAO {
    return _planetDAOInstance ??= _$PlanetDAO(database, changeListener);
  }
}

class _$NasaArticleDao extends NasaArticleDao {
  _$NasaArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _nasaArticleModelInsertionAdapter = InsertionAdapter(
            database,
            'nasaArticle',
            (NasaArticleModel item) => <String, Object?>{
                  'title': item.title,
                  'hdurl': item.hdurl,
                  'date': item.date,
                  'explanation': item.explanation,
                  'copyright': item.copyright
                }),
        _nasaArticleModelDeletionAdapter = DeletionAdapter(
            database,
            'nasaArticle',
            ['title'],
            (NasaArticleModel item) => <String, Object?>{
                  'title': item.title,
                  'hdurl': item.hdurl,
                  'date': item.date,
                  'explanation': item.explanation,
                  'copyright': item.copyright
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NasaArticleModel> _nasaArticleModelInsertionAdapter;

  final DeletionAdapter<NasaArticleModel> _nasaArticleModelDeletionAdapter;

  @override
  Future<List<NasaArticleModel>> getSavedNasaArticles() async {
    return _queryAdapter.queryList('SELECT * FROM nasaArticle',
        mapper: (Map<String, Object?> row) => NasaArticleModel(
            title: row['title'] as String?,
            hdurl: row['hdurl'] as String?,
            date: row['date'] as String?,
            explanation: row['explanation'] as String?,
            copyright: row['copyright'] as String?));
  }

  @override
  Future<void> insertNasaArticle(NasaArticleModel model) async {
    await _nasaArticleModelInsertionAdapter.insert(
        model, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeNasaArticle(NasaArticleModel model) async {
    await _nasaArticleModelDeletionAdapter.delete(model);
  }
}

class _$PlanetDAO extends PlanetDAO {
  _$PlanetDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _planetModelInsertionAdapter = InsertionAdapter(
            database,
            'planets',
            (PlanetModel item) => <String, Object?>{
                  'name': item.name,
                  'description': item.description,
                  'image_url': item.image_url,
                  'planetType': item.planetType,
                  'explanation': item.explanation,
                  'whatis': item.whatis
                }),
        _planetModelDeletionAdapter = DeletionAdapter(
            database,
            'planets',
            ['name'],
            (PlanetModel item) => <String, Object?>{
                  'name': item.name,
                  'description': item.description,
                  'image_url': item.image_url,
                  'planetType': item.planetType,
                  'explanation': item.explanation,
                  'whatis': item.whatis
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PlanetModel> _planetModelInsertionAdapter;

  final DeletionAdapter<PlanetModel> _planetModelDeletionAdapter;

  @override
  Future<List<PlanetModel>> getSavedNasaArticles() async {
    return _queryAdapter.queryList('SELECT * FROM planets',
        mapper: (Map<String, Object?> row) => PlanetModel(
            name: row['name'] as String?,
            description: row['description'] as String?,
            image_url: row['image_url'] as String?,
            planetType: row['planetType'] as String?,
            explanation: row['explanation'] as String?,
            whatis: row['whatis'] as String?));
  }

  @override
  Future<void> insertNasaArticle(PlanetModel model) async {
    await _planetModelInsertionAdapter.insert(model, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeNasaArticle(PlanetModel model) async {
    await _planetModelDeletionAdapter.delete(model);
  }
}
