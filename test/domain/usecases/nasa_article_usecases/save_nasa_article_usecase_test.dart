import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/errors/exceptions.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/save_nasa_article_usecase.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {

  late SaveNasaArticleUseCase saveNasaArticleUseCase;
  late MockNasaArticleRepository mockNasaArticleRepository;

  setUp(() {
    mockNasaArticleRepository = MockNasaArticleRepository();
    saveNasaArticleUseCase = SaveNasaArticleUseCase(mockNasaArticleRepository);
  });

  const nasaArticleDetail = NasaArticleEntity(
    explanation: "With image data from telescopes large and small, this close-up features the dusty Elephant's Trunk Nebula. It winds through the emission nebula and young star cluster complex IC 1396, in the high and far off constellation of Cepheus. Also known as vdB 142, the cosmic elephant's trunk is over 20 light-years long. The colorful view highlights bright, swept-back ridges that outline the region's pockets of cool interstellar dust and gas. Such embedded, dark, tendril-shaped clouds contain the raw material for star formation and hide protostars within. Nearly 3,000 light-years distant, the relatively faint IC 1396 complex covers a large region on the sky, spanning over 5 degrees. This dramatic scene spans a 1 degree wide field, about the size of 2 Full Moons.",
    copyright: "Robert Gendler",
    date: "2018-01-16",
    hdurl: "https://apod.nasa.gov/apod/image/1801/VDB142-ESO-L.jpg",
    title: "An Elephant's Trunk in Cepheus",
  );

  test('should save a NasaArticleEntity', () async {
    // Arrange
    when(mockNasaArticleRepository.saveNasaArticle(nasaArticleDetail))
        .thenAnswer((_) async => Future.value()); // assuming void return
    // Act
    await saveNasaArticleUseCase.call(params: nasaArticleDetail);
    // Assert
    verify(mockNasaArticleRepository.saveNasaArticle(nasaArticleDetail)).called(1);
    verifyNoMoreInteractions(mockNasaArticleRepository);
  });

  test('should throw an exception if saving a NasaArticleEntity fails', () async {
    // Arrange
    final exception = DatabaseInsertException("Saving failed");
    when(mockNasaArticleRepository.saveNasaArticle(any))
        .thenThrow(exception);
    // Act
    Future<void> result() async => await saveNasaArticleUseCase.call(params: nasaArticleDetail);
    // Assert
    expect(result, throwsA(isInstanceOf<DatabaseInsertException>()));
    verify(mockNasaArticleRepository.saveNasaArticle(nasaArticleDetail)).called(1);
    verifyNoMoreInteractions(mockNasaArticleRepository);
  });

}
