// Custom painter for stars
import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double animationValue;

  StarPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    // Draw twinkling stars
    for (var i = 0; i < 10; i++) {
      double x = Random().nextDouble() * size.width;
      double y = Random().nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), animationValue + 0.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}