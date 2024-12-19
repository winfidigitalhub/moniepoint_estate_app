

import 'package:flutter/cupertino.dart';

class SlideInCardText extends StatefulWidget {
  final String text;
  final Duration duration;
  final TextStyle textStyle;

  const SlideInCardText({
    required this.text,
    required this.duration,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  _SlideInCardTextState createState() => _SlideInCardTextState();
}

class _SlideInCardTextState extends State<SlideInCardText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Slide the text from below (Offset(0, 1)) to its normal position (Offset(0, 0))
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Starts below the widget
      end: Offset(0, 0), // Ends at its final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SlideTransition(
        position: _slideAnimation,
        // Use the slide animation to control position
        child: Text(
          widget.text,
          style: widget.textStyle,
        ),
      ),
    );
  }
}




class SlideInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const SlideInAnimation({
    required this.child,
    required this.duration,
    super.key,
  });

  @override
  _SlideInAnimation createState() => _SlideInAnimation();
}

class _SlideInAnimation extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Slide the text from below (Offset(0, 1)) to its normal position (Offset(0, 0))
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Starts below the widget
      end: Offset(0, 0), // Ends at its final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SlideTransition(
          position: _slideAnimation,
          // Use the slide animation to control position
          child: widget.child),
    );
  }
}