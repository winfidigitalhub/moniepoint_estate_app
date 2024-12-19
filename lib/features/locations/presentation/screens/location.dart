import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/features/locations/presentation/widgets/list_of_variants.dart';
import 'package:real_estate_app/features/locations/presentation/widgets/mapPin.dart';
import '../../../../animations/zoomAnimation.dart';
import '../../data/repository/location_provider.dart';
import '../widgets/page_icons.dart';
import '../widgets/search_bar.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    LocationProvider lp = Provider.of<LocationProvider>(context);


    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //background image
          Image.asset(
            'assets/images/map_background.png', // Replace with your image asset path
            fit: BoxFit.cover, // Ensures the image fills the space
          ),

          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBarWidget(),
                Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PageIcons(),
                      IconZoomIn(durationSec: 2, child: ListOfVariants()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          
          Positioned(
              left: 150,
              bottom: 500,
              child: lp.allLocationPageAnimationDone ?  ZoomInBottomMapPin(

              child: mapPin(context)): Container()),

          Positioned(
              left: 300,
              bottom: 200,
              child:  lp.allLocationPageAnimationDone ? ZoomInBottomMapPin(

              child: mapPin(context)): Container()),

          Positioned(
              left: 300,
              top: 200,
              child: lp.allLocationPageAnimationDone ? ZoomInBottomMapPin(child: mapPin(context)) : Container()),

          Positioned(
              left: 400,
              top: 300,
              child: lp.allLocationPageAnimationDone ? ZoomInBottomMapPin(child: mapPin(context)): Container()),

          Positioned(
              left: 150,
              bottom: 350,
              child: lp.allLocationPageAnimationDone ? ZoomInBottomMapPin(child: mapPin(context)): Container()),
        ],
      ),
    );
  }
}


