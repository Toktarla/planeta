import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/features/presentation/pages/practice/practice_planets_page.dart';
import '../../../../config/routes/route_animations/fade_in_route_animation.dart';
import '../../../../injection_container.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int index;

  ResultScreen(this.score, {Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _prefs = sl<SharedPreferences>();
    return Scaffold(
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40)
            ),
          ),
          SizedBox(
            height: 45.0.h,
          ),
          Text(
            "You Score is",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 40),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Text(
            "$score",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100.0.h,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.push(context, FadeInRoute(page: PracticePlanetsPage(), routeName: "/PracticePlanetsPage"));
              _prefs.setInt("quiz${index + 1}_last_score", score);
            },
            shape: StadiumBorder(),
            fillColor: Colors.deepPurple,
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Repeat the quiz",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}