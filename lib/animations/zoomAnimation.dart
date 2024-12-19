import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/features/locations/data/repository/location_provider.dart';

class IconZoomIn extends StatefulWidget {
  const IconZoomIn({super.key, required this.child, required this.durationSec});

  final Widget child;
  final int durationSec;

  @override
  _IconZoomInState createState() => _IconZoomInState();
}

class _IconZoomInState extends State<IconZoomIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.durationSec),
      // Adjust duration for desired effect
      vsync: this,
    );

    // Define the animation to scale from 0 (invisible) to 1 (full size)
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth zoom effect
      ),
    );

    // Start the animation
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        LocationProvider ap = Provider.of<LocationProvider>(context, listen: false);
        ap.updateAllLocationPageAnimationDone(true);
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
    return Center(
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
              scale: _scaleAnimation.value, child: widget.child);
        },
      ),
    );
  }
}

class ZoomInBottomLeftAnimation extends StatefulWidget {
  const ZoomInBottomLeftAnimation({super.key, required this.child});

  final Widget child;

  @override
  _ZoomInBottomLeftAnimation createState() => _ZoomInBottomLeftAnimation();
}

class _ZoomInBottomLeftAnimation extends State<ZoomInBottomLeftAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Define the zoom-in animation with scale values
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
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
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          alignment: Alignment.bottomLeft,
          // Zooms in from the bottom-left corner
          scale: _scaleAnimation.value,
          // Controls the zoom scale value
          child: Container(
            width: 200, // Initial width
            height: 220, // Initial height
            decoration: BoxDecoration(
              // color: Colors.blueAccent,  // Container color
              borderRadius: BorderRadius.circular(20), // Border radius
            ),
            child: Center(child: widget.child),
          ),
        );
      },
    );
  }
}

class ZoomInBottomMapPin extends StatefulWidget {
  const ZoomInBottomMapPin(
      {super.key,
      required this.child,});

  final Widget child;
// Y-coordinate

  @override
  _ZoomInBottomMapPin createState() => _ZoomInBottomMapPin();
}

class _ZoomInBottomMapPin extends State<ZoomInBottomMapPin>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Define the zoom-in animation with scale values
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
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

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          alignment: Alignment.bottomLeft, // Zooms in from the bottom-left corner
          scale: _scaleAnimation.value, // Controls the zoom scale value
          child: Center(child: widget.child),
        );
      },
    );
  }
}
