import 'package:equatable/equatable.dart';

class NasaArticleEntity extends Equatable {
  final String? title;
  final String? hdurl;
  final String? date;
  final String? explanation;
  final String? copyright;

  const NasaArticleEntity({
   this.title,
   this.hdurl,
   this.date,
   this.explanation,
   this.copyright
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title,hdurl,date,explanation,copyright];
}