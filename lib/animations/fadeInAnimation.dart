
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FadeInBlurText extends StatelessWidget {
  final String text;
  final Duration duration;
  final TextStyle textStyle;

  const FadeInBlurText({
    required this.text,
    required this.duration,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 5.0, end: 0.0),
      // Blur starts high and reduces
      duration: duration,
      builder: (context, blurValue, child) {
        double opacity =
            1.0 - (blurValue / 10.0); // Calculate opacity dynamically
        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: blurValue,
              sigmaY: blurValue,
            ),
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        );
      },
    );
  }
}
