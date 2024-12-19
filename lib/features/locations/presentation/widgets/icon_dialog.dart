import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../animations/dropDownAnimation.dart';
import '../../../../animations/zoomAnimation.dart';

class IconWithDialog extends StatefulWidget {
  const IconWithDialog({super.key});

  @override
  _IconWithDialogState createState() => _IconWithDialogState();
}

class _IconWithDialogState extends State<IconWithDialog> {
  final GlobalKey _iconKey = GlobalKey(); // Key for the icon widget

  @override
  Widget build(BuildContext context) {
    return IconZoomIn(
      durationSec: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          // Centers the child within the circle

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: GestureDetector(
              onTap: () {
                _showDropdownAtIconPosition(context);
              },
              child: Image.asset(
                "assets/images/layers_icon.png",
                key: _iconKey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdownAtIconPosition(BuildContext context) {
    // Get the position of the icon widget
    final RenderBox renderBox =
    _iconKey.currentContext?.findRenderObject() as RenderBox;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(
          Offset.zero); // Get the position of the top-left corner of the icon

      // Now, show the dialog at this position
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDropdown(
              position: position); // Pass the position to the dropdown
        },
      );
    }
  }
}