import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/presentation/pages/practice/learn_planets_page.dart';
import 'package:untitled/features/presentation/pages/practice/practice_planets_page.dart';
import 'package:untitled/features/presentation/widgets/practice_list_tile.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.introduction_text_practice_page,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
            ),
             SizedBox(
              height: 20.w,
            ),
            PracticeListTile(
              width: width,
              height: height,
              title: AppLocalizations.of(context)!.learn_planets,
              icon: FontAwesomeIcons.arrowRight,
              imageUrl: "assets/images/bg_planet_image.jpg",
              route: '/LearnPlanetsPage',
              page: LearnPlanetsPage(),

            ),
            const SizedBox(
              height: 20,
            ),
            PracticeListTile(
              width: width,
              height: height,
              title: AppLocalizations.of(context)!.practice_planets,
              icon: FontAwesomeIcons.arrowRight,
              imageUrl: "assets/images/quiz_planets.jpg",
              route: '/PracticePlanetsPage',
              page: PracticePlanetsPage(),

            ),
          ],
        ),
      ),
    );
  }
}
