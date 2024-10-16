import 'package:flutter/material.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/presentation/pages/introduction/star_painter.dart';

class PlanetFullscreenPage extends StatelessWidget {
  final PlanetModel planet;
  final Animation<double> starAnimation;

  const PlanetFullscreenPage({required this.planet, required this.starAnimation});

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
                painter: StarPainter(starAnimation.value),
              );
            },
          ),
        ),
      ],
    );
  }
}
