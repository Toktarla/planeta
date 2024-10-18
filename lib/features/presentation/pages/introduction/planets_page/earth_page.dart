import 'package:flutter/material.dart';
import 'package:untitled/features/presentation/widgets/star_painter.dart';
import '../../../../data/models/planet_model.dart';

class EarthPage extends StatelessWidget {

  final Animation<double> starAnimation;
  final Animation<double> moonRotation;
  final PlanetModel planet;


  EarthPage({required this.starAnimation,required this.moonRotation, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: SizedBox(
              height: 400,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                planet.image_url!,
                key: ValueKey<String>(planet.name!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: starAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: StarPainter(starAnimation.value,),
              );
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Transform.rotate(
            angle: moonRotation.value,
            child: Image.asset('assets/images/moon_icon.png', width: 100,height: 100,),
          ),
        ),
      ],
    );
  }
}

