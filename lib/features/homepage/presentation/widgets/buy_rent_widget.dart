import 'package:flutter/material.dart';
import 'package:real_estate_app/features/homepage/presentation/widgets/rounded_square_container.dart';
import '../../../../animations/counterAnimation.dart';
import '../../../../animations/zoomAnimation.dart';
import '../screens/homepage.dart';
import 'circular_container.dart';

class BuyRentWidget extends StatefulWidget {
  const BuyRentWidget({Key? key}) : super(key: key);

  @override
  _BuyRentWidgetState createState() => _BuyRentWidgetState();
}

class _BuyRentWidgetState extends State<BuyRentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconZoomIn(
          durationSec: 2,
          child: CircularContainer(
            diameter: 200, // Diameter of the circular container
            color: const Color(0XFFFCA616), // Background color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "BUY",
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CountUpWidget(
                  targetValue: 1050,
                  color: Colors.white,
                ),
                const Text("offers",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconZoomIn(
          durationSec: 2,
          child: RoundedSquareContainer(
            size: 180,
            color: const Color(0xffffffff), // Background color
            borderRadius: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "RENT",
                    style: TextStyle(
                        color: Color(0xffAE9972), fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CountUpWidget(
                  targetValue: 2250,
                  color: const Color(0xffAE9972),
                ),
                const Text("offers",
                    style: TextStyle(
                        color: Color(0xffAE9972), fontWeight: FontWeight.w500))
              ],
            ), //
            // Content inside
          ),
        ),
      ],
    );
  }
}
