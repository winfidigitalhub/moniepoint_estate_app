import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/homepage/data/repository/home_provider.dart';
import 'fadeInAnimation.dart';

class UnveilingAnimation extends StatefulWidget {
  const UnveilingAnimation({
    super.key,
    required this.addressText,
  });

  final String addressText;

  @override
  State<UnveilingAnimation> createState() => _UnveilingAnimationState();
}

class _UnveilingAnimationState extends State<UnveilingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Start the animation
    _controller.forward();

    // Add listener to trigger an action after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        HomeProvider ap = Provider.of<HomeProvider>(context, listen: false);
        ap.updateAllHomePageAnimationDone(true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      // Get the width of the parent container
      final parentWidth = constraints.maxWidth;

      // Define the Tween dynamically based on the parent width
      _widthAnimation = Tween<double>(begin: 0, end: parentWidth).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );

      // Start the animation when the layout is built
      _controller.forward();
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            height: 50,
            width: 300, // Full width of the stack
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Expanding Container with Border Radius
                Container(
                  height: 50,
                  width: _widthAnimation.value,
                  // Dynamically adjust the width

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    // Unified border radius
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      // Blur effect
                      child: Container(
                          width: _widthAnimation.value,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: _widthAnimation.isCompleted
                              ? Center(
                                  child: FadeInBlurText(
                                    text: widget.addressText,
                                    duration: const Duration(milliseconds: 500),
                                    textStyle: const TextStyle(
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : null),
                    ),
                  ),
                ),

                // Sliding Icon
                Positioned(
                  left: _widthAnimation.value - 50,
                  // Adjust to follow the container edge
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:  Image.asset(
                      "assets/images/next_icon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
