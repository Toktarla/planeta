import 'package:flutter/material.dart';
import 'package:untitled/features/data/models/planet_model.dart';

class VenusPage extends StatelessWidget {

  final Animation<double> cloudAnimation;
  final PlanetModel planet;

  VenusPage({required this.cloudAnimation, required this.planet});

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
            animation: cloudAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: CloudPainter(cloudAnimation.value),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Custom painter for cloud effect
class CloudPainter extends CustomPainter {
  final double animationValue;

  CloudPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // Draw clouds
    canvas.drawOval(
      Rect.fromCenter(center: size.center(Offset.zero), width: 250, height: 100 + animationValue * 20),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
