import 'package:flutter/material.dart';

import '../../../../animations/zoomAnimation.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconZoomIn(
          durationSec: 2,
          child: Container(
            width: 300,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color for the search bar
              borderRadius: BorderRadius.circular(30.0), // Rounded corners
              border: Border.all(color: Colors.grey[300]!), // Optional border
            ),
            child: Row(
              children: [
                const SizedBox(width: 10,),
                Image.asset("assets/images/search_icon.png", color: Colors.grey),

                const SizedBox(width: 10),
                // Spacing between the icon and the text field
                const Flexible(
                  fit: FlexFit.loose,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Saint Petersburg",
                      border: InputBorder.none, // Remove the default border
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconZoomIn(
          durationSec: 2,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            // Centers the child within the circle
            child: Image.asset(
              "assets/images/filter_settings_icon.png",
              width: 25,
              height: 25,
            ),
          ),
        )
      ],
    );
  }
}
