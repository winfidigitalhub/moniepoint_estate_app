import 'package:flutter/material.dart';


class RoundedSquareContainer extends StatelessWidget {
  final double size;
  final Color color;
  final double borderRadius;
  final Widget? child;

  const RoundedSquareContainer({
    required this.size,
    required this.color,
    required this.borderRadius,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
      ),
      alignment: Alignment.center,
      // Centers the child within the container
      child: child,
    );
  }
}