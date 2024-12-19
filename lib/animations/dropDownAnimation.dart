import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/animations/zoomAnimation.dart';

import '../features/locations/data/repository/location_provider.dart';


class CustomDropdown extends StatelessWidget {
  final Offset position;

  CustomDropdown({required this.position});

  @override
  Widget build(BuildContext context) {
    LocationProvider ap = Provider.of<LocationProvider>(context, listen: false);

    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy - 200,
          child: ZoomInBottomLeftAnimation(
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  // Rounded corners for the dropdown
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2), // Shadow for the dropdown
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Ensure the dropdown only takes as much space as needed
                  children: [
                    InkWell(
                      child: const Row(
                        children: [
                          Icon(Icons.shield_moon_outlined, size: 30, color: Colors.grey,),
                          SizedBox(width: 10,),
                          Text('Cozy areas', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: const Row(
                        children: [
                          Icon(Icons.account_balance_wallet_outlined, size: 30, color: Colors.yellow,),
                          SizedBox(width: 10,),
                          Text('Price',style: TextStyle(fontSize: 17, color: Colors.yellow, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: const Row(
                        children: [
                          Icon(Icons.balcony_sharp, size: 30, color: Colors.grey,),
                          SizedBox(width: 10,),
                          Text('Infrastructure',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Row(
                        children: [
                       Image.asset(
                            "assets/images/layers_icon.png",
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10,),
                          const Expanded(
                              child:
                              Text('Without any layer', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),)),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        ap.updateMapPinExtend(!ap.mapPinExtend);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}