import 'package:device_preview/device_preview.dart';
import 'package:floor_generator/misc/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/presentation/cubit/localization_cubit.dart';
import 'package:untitled/features/presentation/pages/practice/quiz_result_screen.dart';
import '../../../../../../injection_container.dart';
import '../../../domain/entities/question_entity.dart';

class PlanetQuizPage extends StatefulWidget {
  PlanetQuizPage(
      {Key? key,
      required this.quizTitle,
      required this.questions,
      required this.indexOfQuiz,
        required this.language
      })
      : super(key: key) {
    questions.shuffle();

    if (indexOfQuiz != 5) {
      for (final question in questions) {
        final originalAnswer = question.answer;
        question.variants!.shuffle();
        final newAnswerIndex = question.variants!.indexOf(originalAnswer);
        question.answer = question.variants![newAnswerIndex];
      }
    } else {
      for (final question in questions) {
        final originalAnswer;
        language == "ru" ? originalAnswer = translateToRussian(extractFromImagePathPlanetName(question.answer).capitalize())
            :         originalAnswer = extractFromImagePathPlanetName(question.answer).capitalize();
        ;
        question.variants!.shuffle();
        final newAnswerIndex = question.variants!.indexOf(originalAnswer);
        question.answer = question.variants![newAnswerIndex];
      }
    }
  }

  final String quizTitle;
  final List<QuestionEntity> questions;
  final int indexOfQuiz;
  final String language;

  @override
  _PlanetQuizPageState createState() => _PlanetQuizPageState();
}

class _PlanetQuizPageState extends State<PlanetQuizPage> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;

  bool checkAnswer(String? variant, int index, int quizIndex) {
    bool isPhoto = quizIndex == 5;

    return isPhoto
        ? (widget.questions[index].answer).toUpperCase() ==
            variant!.toUpperCase()
        : widget.questions[index].answer == variant;
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs = sl.get<SharedPreferences>();

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(
          widget.quizTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            final shouldLeave = await _onWillPop();
            if (shouldLeave) {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: PageView.builder(
              controller: _controller!,
              onPageChanged: (page) {
                if (page == widget.questions.length - 1) {
                  setState(() {
                    btnText = "Finish Quiz";
                  });
                }
                setState(() {
                  answered = false;
                });
              },
              itemCount: widget.questions.length,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Question ${index + 1}/10",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 28),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 2,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: widget.indexOfQuiz == 5 ? 50 : 200,
                      child: Text("${widget.questions[index].question}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 22)),
                    ),
                    widget.indexOfQuiz == 5
                        ? Container(
                          height: 150.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: Image.asset(
                                    "assets/images/${widget.language == "ru" ? translateToEnglish(widget.questions[index].answer).toLowerCase() :  widget.questions[index].answer.toLowerCase() }_icon.png")
                                .image,
                          )),
                        )
                        : Container(),
                    for (int i = 0;
                        i < widget.questions[index].numberOfVariants;
                        i++)
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        margin: EdgeInsets.only(
                            bottom: 20.0, left: 12.0, right: 12.0),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          fillColor: btnPressed
                              ? checkAnswer(
                                      widget.questions[index].variants![i],
                                      index,
                                      widget.indexOfQuiz)
                                  ? Colors.green
                                  : Colors.red[600]
                              : Theme.of(context).primaryColor,
                          onPressed: !answered
                              ? () {
                                  if (checkAnswer(
                                      widget.questions[index].variants![i],
                                      index,
                                      widget.indexOfQuiz)) {
                                    score++;
                                  }

                                  setState(() {
                                    btnPressed = true;
                                    answered = true;
                                  });
                                }
                              : null,
                          child: Text(widget.questions[index].variants![i],
                              style: Theme.of(context).textTheme.displayLarge),
                        ),
                      ),
                    SizedBox(
                      height: 40.0,
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        if (_controller!.page?.toInt() ==
                            widget.questions.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                        score,
                                        index: widget.indexOfQuiz,
                                      )));
                        } else {
                          _controller!.nextPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInExpo);

                          setState(() {
                            btnPressed = false;
                          });
                        }
                      },
                      shape: StadiumBorder(),
                      fillColor: Colors.deepPurple,
                      padding: EdgeInsets.all(18.0),
                      elevation: 0.0,
                      child: Text(
                        btnText,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: BlocBuilder<LocalizationCubit, String>(
              builder: (context, state) {
                if (state == "ru") {
                  return Text('Вы уверены?');
                }

                return Text('Are you sure?');
              },
            ),
            content: BlocBuilder<LocalizationCubit, String>(
              builder: (context, state) {
                if (state == "ru") {
                  return Text(
                      'Вы хотите покинуть квиз? Ваш прогресс будет потерян');
                }
                return Text(
                    'Do you want to exit the quiz? Your progress might be lost');
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: BlocBuilder<LocalizationCubit, String>(
                  builder: (context, state) {
                    if (state == "ru") {
                      return Text('Нет');
                    }
                    return Text('No');
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: BlocBuilder<LocalizationCubit, String>(
                  builder: (context, state) {
                    if (state == "ru") {
                      return Text('Да');
                    }
                    return Text('Yes');
                  },
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
