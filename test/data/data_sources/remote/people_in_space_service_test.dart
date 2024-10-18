import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/data/data_sources/remote/people_in_space_service.dart';
import 'package:untitled/features/domain/entities/people_in_space.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late AstroApiService astroApiService;

  setUp(() {
    mockDio = MockDio();
    astroApiService = AstroApiService(mockDio);
  });

  group('fetchAstronauts', () {
    test('should throw an exception when the response code is not 200', () async {
      // arrange
      when(mockDio.get(astroJsonUrl)).thenAnswer(
            (_) async => Response(
          data: 'Something went wrong',
          statusCode: 404,
          requestOptions: RequestOptions(path: astroJsonUrl),
        ),
      );

      // act
      final call = astroApiService.fetchAstronauts;

      // assert
      expect(() => call(), throwsA(isInstanceOf<Exception>()));
      verify(mockDio.get(astroJsonUrl));
      verifyNoMoreInteractions(mockDio);
    });
  });
}
