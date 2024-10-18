import 'package:dio/dio.dart';
import 'package:untitled/core/constants/constants.dart';
import '../../../domain/entities/people_in_space.dart';

class AstroApiService {
  final Dio _dio;
  AstroApiService(this._dio);

  Future<AstroResponse> fetchAstronauts() async {
    try {
      final response = await _dio.get(astroJsonUrl);

      if (response.statusCode == 200) {
        return AstroResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load astronauts');
      }
    } catch (e) {
      throw Exception('Failed to load astronauts: $e');
    }
  }
}
