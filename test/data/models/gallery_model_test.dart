import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/features/data/models/gallery_model.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';

void main() {


   var testGalleryModel = GalleryModel(
       total: 1000,
       totalPages: 100,
       results: [
         Result(
             id: "sample_id",
             description: "A beautiful scenery",
             altDescription: "Mountains with a clear sky",
             urls: Urls(
                 raw: "https://example.com/raw.jpg",
                 full: "https://example.com/full.jpg",
                 regular: "https://example.com/regular.jpg",
                 small: "https://example.com/small.jpg",
                 thumb: "https://example.com/thumb.jpg"
             ),
             links: Links(
                 self: "https://api.example.com/photos/sample_id",
                 html: "https://example.com/photos/sample_id",
                 download: "https://example.com/photos/sample_id/download",
                 downloadLocation: "https://api.example.com/photos/sample_id/download"
             ),
             likes: 45
         )
       ]
   );

  test(
    'should be a subclass of GalleryEntity',
        () async {
      // assert
      expect(testGalleryModel, isA<GalleryEntity>());
    },
  );

  // test(
  //   'should return a valid model from JSON',
  //       () async {
  //     // arrange
  //     final String jsonString = await File('test/helpers/dummy_data/dummy_gallery_response.json').readAsString(); // provide the correct path
  //     final Map<String, dynamic> jsonMap = json.decode(jsonString);
  //
  //     // act
  //     final result = GalleryModel.fromJson(jsonMap);
  //
  //     // assert
  //     expect(result, equals(testGalleryModel));
  //   },
  // );
  //
  // test(
  //   'should return a JSON map containing the proper data',
  //       () async {
  //     // act
  //     final result = testGalleryModel.toJson();
  //
  //     // assert
  //     final jsonMap = {
  //       "total": 1000,
  //       "total_pages": 100,
  //       "results": [
  //         {
  //           "id": "sample_id",
  //           "description": "A beautiful scenery",
  //           "alt_description": "Mountains with a clear sky",
  //           "urls": {
  //             "raw": "https://example.com/raw.jpg",
  //             "full": "https://example.com/full.jpg",
  //             "regular": "https://example.com/regular.jpg",
  //             "small": "https://example.com/small.jpg",
  //             "thumb": "https://example.com/thumb.jpg"
  //           },
  //           "links": {
  //             "self": "https://api.example.com/photos/sample_id",
  //             "html": "https://example.com/photos/sample_id",
  //             "download": "https://example.com/photos/sample_id/download",
  //             "download_location": "https://api.example.com/photos/sample_id/download"
  //           },
  //           "likes": 45
  //         }
  //       ]
  //     };
  //
  //
  //     expect(result, jsonMap);
  //   },
  // );
}
