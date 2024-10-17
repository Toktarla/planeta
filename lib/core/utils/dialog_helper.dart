import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/constants/app_text_styles.dart';
import 'package:untitled/core/route_animations/fade_in_route_animation.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/presentation/pages/home/bottom_navigation.dart';
import 'package:untitled/features/presentation/widgets/circle_button.dart';

import '../../features/presentation/pages/settings/settings_page.dart';
import '../constants/app_colors.dart';

class DialogHelper {

  static openFullScreenDialog(BuildContext context, List<PlanetModel> planets) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(0),
          child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
              child: Stack(
                children: [
                  // Close Button
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleButton(
                      width: 60,
                      height: 60,
                      circleColor: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: AppColors.whiteColor),
                    ),
                  ),

                  // Settings Button
                  Positioned(
                    top: 16,
                    right: 16,
                    child: CircleButton(
                      width: 60,
                      height: 60,
                      circleColor: Colors.black,
                      onPressed: () {
                        DialogHelper.openAnimatedSettingsPage(context);
                      },
                      child: Icon(Icons.settings, color: AppColors.whiteColor),
                    ),
                  ),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated Grid of planets using flutter_staggered_animations
                        AnimationLimiter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: planets.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                columnCount: 3,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: AppColors.whiteColor, width: 3),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.asset(
                                            planets[index].image_url!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 40),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FadeIn(duration: const Duration(milliseconds: 400),child: FaIcon(FontAwesomeIcons.earthAmericas, color: AppColors.whiteColor)),
                                    const SizedBox(width: 10),
                                    FadeIn(
                                      delay: const Duration(milliseconds: 600),
                                      child: Text(
                                        "Explore the planets",
                                        style: Theme.of(context).textTheme.displayLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FadeIn(
                                delay: const Duration(milliseconds: 400),
                                child: Divider(
                                  color: Colors.white,
                                  height: 32,
                                  thickness: 3,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, FadeInRoute(page: BottomNavigation(), routeName: '/BottomNavigation'));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book, color: AppColors.whiteColor),
                                    const SizedBox(width: 10),
                                    FadeIn(
                                      delay: Duration(milliseconds: 900),
                                      child: Text(
                                        "Practice and learn planets",
                                        style: Theme.of(context).textTheme.displayLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static openAnimatedSettingsPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(), // Show full settings page
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide in from right
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}