import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/get_saved_nasa_articles_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetSavedNasaArticlesUseCase getSavedNasaArticlesUseCase;
  late MockNasaArticleRepository mockNasaArticleRepository;

  setUp(() {
    mockNasaArticleRepository = MockNasaArticleRepository();
    getSavedNasaArticlesUseCase = GetSavedNasaArticlesUseCase(mockNasaArticleRepository);
  });

  test('should call the getSavedNasaArticles method from the repository', () async {
    // Arrange
    when(mockNasaArticleRepository.getSavedNasaArticles())
        .thenAnswer((_) async => []);

    // Act
    await getSavedNasaArticlesUseCase.call();

    // Assert
    verify(mockNasaArticleRepository.getSavedNasaArticles()).called(1);
    verifyNoMoreInteractions(mockNasaArticleRepository);
  });

  test('should return list of NasaArticle when repository returns them', () async {
    // Arrange
    final List<NasaArticleEntity> tNasaArticlesList = [
      NasaArticleEntity(title: 'Test Article 1'),
      NasaArticleEntity(title: 'Test Article 2'),
    ];
    when(mockNasaArticleRepository.getSavedNasaArticles())
        .thenAnswer((_) async => tNasaArticlesList);

    // Act
    final result = await getSavedNasaArticlesUseCase.call();

    // Assert
    expect(result, equals(tNasaArticlesList));
  });

  test('should throw an exception if getting saved articles fails', () async {
    // Arrange
    when(mockNasaArticleRepository.getSavedNasaArticles())
        .thenThrow(Exception('Failed to fetch saved articles'));

    // Act & Assert
    expect(() => getSavedNasaArticlesUseCase.call(), throwsException);
  });
}
