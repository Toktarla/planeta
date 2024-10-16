import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/domain/usecases/gallery_usecases/get_photos_by_query_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetPhotosByQueryUseCase getPhotosByQueryUseCase;
  late MockGalleryRepository mockGalleryRepository;

  setUp(() {
    mockGalleryRepository = MockGalleryRepository();
    getPhotosByQueryUseCase = GetPhotosByQueryUseCase(mockGalleryRepository);
  });

  final tQuery = "planet";
  final tPerPage = "1";
  final tGalleryEntity = GalleryEntity(
    total: 3786,
    totalPages: 1262,
    results: [
      Result(
        id: "2W-QWAC0mzI",
        description: "Saturn as seen from the Cassini–Huygens space-research mission",
        altDescription: "Saturn and its rings",
        urls: Urls(
          raw: "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA&ixlib=rb-4.0.3",
          full: "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA&ixlib=rb-4.0.3&q=85",
          regular: "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA&ixlib=rb-4.0.3&q=80&w=1080",
          small: "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA&ixlib=rb-4.0.3&q=80&w=400",
          thumb: "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA&ixlib=rb-4.0.3&q=80&w=200",
        ),
        links: Links(
          self: "https://api.unsplash.com/photos/saturn-and-its-rings-2W-QWAC0mzI",
          html: "https://unsplash.com/photos/saturn-and-its-rings-2W-QWAC0mzI",
          download: "https://unsplash.com/photos/2W-QWAC0mzI/download?ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA",
          downloadLocation: "https://api.unsplash.com/photos/2W-QWAC0mzI/download?ixid=M3w1MTYxNDN8MHwxfHNlYXJjaHwxfHxwbGFuZXR8ZW58MHx8fHwxNjk4MTczNjQ0fDA",
        ),
        likes: 1576,
      ),
    ],
  );


  test(
    'should get photos for the query from the repository',
        () async {
      // arrange
      when(mockGalleryRepository.getPhotosByQuery.call(tQuery,tPerPage)).thenAnswer((_) async => DataSuccess(tGalleryEntity));
      // act
      final result = await getPhotosByQueryUseCase.call(
        params: [tQuery, tPerPage]
      );
      // assert
      expect(result.data, equals(tGalleryEntity));
      verify(mockGalleryRepository.getPhotosByQuery(
       tQuery,
      tPerPage,
      ));
      verifyNoMoreInteractions(mockGalleryRepository);
    },
  );

  test(
    'should throw an exception if getting photos fails',
        () async {
      // arrange
      when(mockGalleryRepository.getPhotosByQuery.call(tQuery,tPerPage)).thenThrow(DioException(requestOptions: RequestOptions()));
      // act
      final call = () async => await getPhotosByQueryUseCase.call(params: [tQuery,tPerPage]);
      // assert
      expect(call, throwsA(isInstanceOf<DioException>()));

      verify(mockGalleryRepository.getPhotosByQuery(
        tQuery,
        tPerPage,
      ));
      verifyNoMoreInteractions(mockGalleryRepository);
    },
  );
}
