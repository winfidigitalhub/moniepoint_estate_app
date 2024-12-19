import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountUpWidget extends StatefulWidget {
  final int targetValue;
  final Color color;

  CountUpWidget({required this.targetValue, required this.color});

  @override
  _CountUpWidgetState createState() => _CountUpWidgetState();
}

class _CountUpWidgetState extends State<CountUpWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _countAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with the duration for the count-up effect
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Set the duration of the animation
    );

    // Create the Tween to animate from 0 to the target value
    _countAnimation = IntTween(begin: 0, end: widget.targetValue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Animation curve
      ),
    );

    // Start the animation when the widget is initialized
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          '${_countAnimation.value}', // Display the current count value
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, letterSpacing: 2, color: widget.color),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}