import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../animations/zoomAnimation.dart';
import 'icon_dialog.dart';


class PageIcons extends StatefulWidget {
  const PageIcons({super.key});

  @override
  State<PageIcons> createState() => _PageIconsState();
}

class _PageIconsState extends State<PageIcons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IconWithDialog(),
        const SizedBox(
          height: 10,
        ),
        IconZoomIn(
          durationSec: 2,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            // Centers the child within the circle
            child: ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Image.asset(
                    "assets/images/navigation_icon.png",
                    color: Colors.white,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
