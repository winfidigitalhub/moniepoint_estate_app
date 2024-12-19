import 'package:flutter/material.dart';

import '../../../../animations/fadeInAnimation.dart';
import '../../../../animations/slideInAnimation.dart';
import '../../../../animations/unScrollingAnimation.dart';
import '../../../../animations/zoomAnimation.dart';
import 'buy_rent_widget.dart';
import 'home_grid_view.dart';


class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backg.png'),
              // Path to your image
              fit: BoxFit.cover, // Makes the image cover the entire container
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UnscrollingEntranceAnimation(),
                        IconZoomIn(
                          durationSec: 2,
                          child: Image.asset(
                            "assets/images/pfp.png",
                            // Change to your desired icon
                            width: 50, //
                            height: 50, //
                            // color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FadeInBlurText(
                      text: "Hi, Marina",
                      duration: Duration(seconds: 2),
                      textStyle: TextStyle(
                        fontSize: 23,
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffAF9E7A),
                      ),
                    ),
                    const SlideInCardText(
                      text: "let's select your\nperfect place",
                      duration: Duration(seconds: 2),
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BuyRentWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SlideInAnimation(
                  duration: Duration(seconds: 3), child: GridViewWidget()),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    // Return the child without a scrollbar
    return child;
  }
}