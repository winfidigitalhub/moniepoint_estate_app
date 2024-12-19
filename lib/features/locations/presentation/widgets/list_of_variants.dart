import 'dart:ui';

import 'package:flutter/material.dart';


class ListOfVariants extends StatefulWidget {
  const ListOfVariants({super.key});

  @override
  State<ListOfVariants> createState() => _ListOfVariantsState();
}

class _ListOfVariantsState extends State<ListOfVariants> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          // Background color for the search bar
          borderRadius: BorderRadius.circular(30.0),
          // Rounded corners
          border: Border.all(color: Colors.grey[300]!), // Optional border
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect

            child: Row(
              children: [
                Image.asset(
                  "assets/images/filter_icon.png",
                  width: 25,
                  height: 25,
                ),
                // Leading search icon
                const SizedBox(width: 10),
                // Spacing between the icon and the text field
                const Text(
                  "List of Variants",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
