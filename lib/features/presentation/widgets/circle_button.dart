import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Widget child;
  final Color circleColor;
  const CircleButton({Key? key, this.onPressed, required this.width, required this.height, required this.child, required this.circleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
        ),
        child: child
      ),
    );
  }
}