import 'package:flutter/material.dart';


class CircularContainer extends StatelessWidget {
  final double diameter;
  final Color color;
  final Widget? child;

  const CircularContainer({
    required this.diameter,
    required this.color,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      // Centers the child within the circle
      child: child,
    );
  }
}