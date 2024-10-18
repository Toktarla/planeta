import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/presentation/cubit/localization_cubit.dart';
import 'package:untitled/features/presentation/pages/practice/planet_quiz_page.dart';
import '../../../../config/routes/route_animations/fade_in_route_animation.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/functions.dart';
import '../../../../injection_container.dart';
import '../../../../l10n/jsonlocalization.dart';
import '../../../domain/entities/question_entity.dart';
import '../home/bottom_navigation.dart';

class PracticePlanetsPage extends StatelessWidget {
  const PracticePlanetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizTitles = AppFunctions.readQuizTitles(context);

    final _prefs = sl<SharedPreferences>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          FadeInRoute(
                              page: BottomNavigation(),
                              routeName: "/BottomNavigation"));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return BlocBuilder<LocalizationCubit, String>(
                        builder: (context, state) {
                          return OutlinedButton(
                            onPressed: () {
                              // Navigator.push(context, FadeInRoute(page: pages[index], routeName: "/QuizPage${index + 1}"));
                              Navigator.push(
                                  context,
                                  FadeInRoute(
                                      page: PlanetQuizPage(
                                        quizTitle: quizTitles[index],
                                        indexOfQuiz: index,
                                        questions: List<
                                            QuestionEntity>.generate(10,
                                                (indexG) {
                                              return QuestionEntity(
                                                  JsonLocalizations.of(context)!
                                                      .translate(
                                                      "quiz${index + 1}",
                                                      "question", indexG),
                                                  [
                                                    JsonLocalizations.of(
                                                        context)!
                                                        .translate(
                                                        "quiz${index + 1}",
                                                        "variant1", indexG),
                                                    JsonLocalizations.of(
                                                        context)!
                                                        .translate(
                                                        "quiz${index + 1}",
                                                        "variant2", indexG),
                                                    JsonLocalizations.of(
                                                        context)!
                                                        .translate(
                                                        "quiz${index + 1}",
                                                        "variant3", indexG),
                                                    JsonLocalizations.of(
                                                        context)!
                                                        .translate(
                                                        "quiz${index + 1}",
                                                        "variant4", indexG),
                                                  ],
                                                  JsonLocalizations.of(context)!
                                                      .translate(
                                                      "quiz${index + 1}",
                                                      "answer", indexG));
                                            }),
                                        language: state,
                                      ),
                                      routeName: "/PlanetQuizPage"));
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 0, color: Colors.transparent),
                            ),
                            child: Container(
                              height: 180.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme
                                    .of(context)
                                    .cardColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(quizTitles[index],
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(fontSize: 18)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "10 questions",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: AppColors.cyanColor),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Last Result: ${_prefs.getInt(
                                          "quiz${index + 1}_last_score") == null
                                          ? "?"
                                          : _prefs.getInt(
                                          "quiz${index + 1}_last_score")}/10",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: AppColors.cyanColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
