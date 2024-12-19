import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../data/repository/location_provider.dart';

Widget mapPin(BuildContext context) {

  LocationProvider ap = Provider.of<LocationProvider>(context);
  return AnimatedContainer(
    height: 50,
    curve: Curves.easeInOut,
    width: ap.mapPinExtend ? 100 : 50 ,
    padding: EdgeInsets.only(left: 10),
    decoration: const BoxDecoration(
      color: Color(0xffFC9E12),
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)), // Rounded corners
    ),
    alignment: Alignment.centerLeft,
    duration: const Duration(milliseconds: 500),
    child: Image.asset(
      "assets/images/apartment_icon.png",
      height: 25,
      width: 25,
    ),
  );
}
