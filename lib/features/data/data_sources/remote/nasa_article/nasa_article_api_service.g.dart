// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_article_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NasaArticleApiService implements NasaArticleApiService {
  _NasaArticleApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.nasa.gov/planetary/apod';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<NasaArticleEntity>> getNasaArticles({
    String? api_key,
    String? date,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': api_key,
      r'date': date,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final uri = Uri.parse(baseUrl!).replace(queryParameters: queryParameters);

    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<NasaArticleEntity>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
            baseUrl: uri.toString() ?? _dio.options.baseUrl
            )));
    var value = _result.data!.map((k, dynamic v) =>
        MapEntry(k, v));

    NasaArticleEntity nasaArticleEntity = NasaArticleEntity(
        title: value['title'],
        hdurl: value['hdurl'],
        date: value['date'],
        copyright: value['copyright'],
        explanation: value['explanation']
    );

    final httpResponse = HttpResponse(nasaArticleEntity, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
