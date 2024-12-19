import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../locations/data/repository/location_provider.dart';
import '../../data/repository/home_provider.dart';
import '../widgets/custom_bottom_navbar.dart';
import '../../../locations/presentation/screens/location.dart';
import '../widgets/homepage_contents.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, e});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _bottomPosition = -100; // Start below the visible area
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();

    // Animate the widget into view after a delay
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _bottomPosition = 0; // Final position
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider hp = Provider.of<HomeProvider>(context);
    LocationProvider lp = Provider.of<LocationProvider>(context);

    Widget page = const LocationScreen();
    switch (_currentIndex) {
      case 0:
        page = const LocationScreen();
        break;
      case 2:
        page = const HomePageContent();
        break;
    }
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: page),

          // Positioned bottom navigation bar
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeOut,
            bottom: hp.allHomePageAnimationDone ? _bottomPosition : -100,
            left: 20,
            right: 20,
            child: ClipRect(
              child: CustomBottomNavBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  HomeProvider hp = Provider.of<HomeProvider>(context, listen: false);
                  lp.updateAllLocationPageAnimationDone(false);
                  setState(() {
                    _currentIndex = index;
                  });
                  if (index == _currentIndex) return;

                  // Navigate with custom animation
                  Navigator.of(context).pushAndRemoveUntil(
                    _createFadeRoute(
                      index == 0
                          ? const LocationScreen()
                          : const HomePageContent(),
                    ),
                        (route) => false, // Clears previous routes for better UX
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Custom Fade Transition
Route _createFadeRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade transition
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}




