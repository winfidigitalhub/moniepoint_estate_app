import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnscrollingEntranceAnimation extends StatefulWidget {
  const UnscrollingEntranceAnimation({super.key});

  @override
  _UnscrollingEntranceAnimationState createState() =>
      _UnscrollingEntranceAnimationState();
}

class _UnscrollingEntranceAnimationState extends State<UnscrollingEntranceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2), // Adjust duration for the unscroll effect
      vsync: this,
    );

    // Define the width animation from 0 (hidden) to full size (1.0)
    _widthAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth reveal effect
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double fullWidth = 200; // Set your full widget width here

    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: _widthAnimation.value, // Reveal based on animation
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius:
                BorderRadius.all(Radius.circular(10)), // Rounded edges
              ),
              width: fullWidth,
              height: 50,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/location_icon.jpg",
                      width: 30,
                      height: 30,
                      //color: Color(0xffAF9E7A),
                      //size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Saint Petersburg',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffAF9E7A)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}