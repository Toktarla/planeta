import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/core/constants/app_text_styles.dart';
import 'package:untitled/core/constants/app_colors.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/presentation/widgets/circle_button.dart';
import 'earth_page.dart';
import 'planet_fullscreen_page.dart';
import 'dart:math' as math;

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> with TickerProviderStateMixin {

  // Animations
  late AnimationController _cloudController;
  late Animation<double> _cloudAnimation;

  late AnimationController _starController;
  late Animation<double> _starAnimation;

  late AnimationController _moonController;
  late Animation<double> _moonRotation;

  final CarouselSliderController _carouselController = CarouselSliderController();
  int currentIndex = 0;


  final List<PlanetModel> planets = [
    PlanetModel(
      name: 'M E R C U R Y',
      image_url: 'assets/images/mercury_icon.png',
      destination: '82 , 000 , 000 K M',
    ),
    PlanetModel(
      name: 'V E N U S',
      image_url: 'assets/images/venus_icon.png',
      destination: '41 , 000 , 000 K M',
    ),
    PlanetModel(
      name: 'E A R T H',
      image_url: 'assets/images/earth_icon.png',
      destination: 'WE ARE HERE',
    ),
    PlanetModel(
      name: 'M A R S',
      image_url: 'assets/images/mars_icon.png',
      destination: '78 , 000 , 000 K M',
    ),
    PlanetModel(
      name: 'J U P I T E R',
      image_url: 'assets/images/jupiter_icon.png',
      destination: '628 , 000 , 000 K M',
    ),
    PlanetModel(
      name: 'S A T U R N',
      image_url: 'assets/images/saturn_icon.png',
      destination: '1275 , 000 , 000 K M',
    ),
    PlanetModel(
      name: 'N E P T U N E',
      image_url: 'assets/images/neptune_icon.png',
      destination: '4347 , 000 , 000 K M',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Venus Animation
    _cloudController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _cloudAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_cloudController);

    // Earth Animation
    _starController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _starAnimation = Tween<double>(begin: 0.0, end: 0.05).animate(_starController);

    _moonController = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..repeat();
    _moonRotation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_moonController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleButton(
                    width: 60,
                    height: 60,
                    circleColor: Colors.black,
                    onPressed: () {

                    },
                    child: Icon(Icons.menu_outlined, color: AppColors.introTitleColor),
                ),
              ),
            ),
            Expanded(
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: planets.length,
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) {
                  final planet = planets[index];
                  if (index == 2) return EarthPage(moonRotation: _moonRotation,starAnimation: _starAnimation,planet: planet);

                  return PlanetFullscreenPage(starAnimation: _starAnimation,planet: planet);
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              planets[currentIndex].name!,
              style: AppTextStyles.introPageTextStyle,
            ),
            SizedBox(height: 16),
            Text(
              planets[currentIndex].destination!,
              style: AppTextStyles.introPageTextStyle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 16),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: planets.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.whiteColor,
                dotHeight: 14,
                dotWidth: 14,
                expansionFactor: 2,
                spacing: 10,
                dotColor: AppColors.whiteColor,
              ),
              onDotClicked: (index) {
                _carouselController.animateToPage(index);
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cloudController.dispose();
    _starController.dispose();
    _moonController.dispose();
    super.dispose();
  }
}
