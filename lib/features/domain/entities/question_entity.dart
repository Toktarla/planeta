class QuestionEntity {
  final String? question;



  final List<String>? variants;
  String answer;
  int get numberOfVariants => 4;

  QuestionEntity(this.question,this.variants, this.answer);


}