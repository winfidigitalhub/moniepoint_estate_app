import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../animations/scrollAnimation.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4, // Total number of columns
          mainAxisSpacing: 8, // Spacing between rows
          crossAxisSpacing: 8, // Spacing between columns
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 4, // Spans all 4 columns
              mainAxisCellCount: 2, // Takes 1 row height
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image with rounded corners
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          "assets/images/grid_image1.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // Positioned widget at the bottom
                    const Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0, // Center horizontally with padding
                        child: UnveilingAnimation(
                          addressText: 'Gladkova St, 25',
                        )),
                  ],
                ),
              ),
            ),
            // Second row: Two square tiles

            // Third row: Tall tile next to a square tile
            StaggeredGridTile.count(
              crossAxisCellCount: 2, // Spans 2 columns
              mainAxisCellCount: 4, // Takes 2 row heights (tall)
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image with rounded corners
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          "assets/images/grid_image4.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    // Positioned widget at the bottom
                    const Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0, // Center horizontally with padding
                        child: UnveilingAnimation(addressText: "Gubina St, 11")),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2, // Spans 2 columns
              mainAxisCellCount: 2, // Takes 1 row height (square)
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image with rounded corners
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          "assets/images/grid_image2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Positioned widget at the bottom
                    const Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0, // Center horizontally with padding
                        child: UnveilingAnimation(
                          addressText: "Trefoleva St, 43",
                        )),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2, // Spans 2 columns
              mainAxisCellCount: 2, // Takes 1 row height (square)
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image with rounded corners
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          "assets/images/grid_image3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Positioned widget at the bottom
                    const Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0, // Center horizontally with padding
                        child: UnveilingAnimation(
                          addressText: "Sedova St, 22",
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
