import 'package:flutter/cupertino.dart';

class LocationProvider extends ChangeNotifier {

  bool allLocationPageAnimationDone = false;
  bool mapPinExtend = true;

  void updateAllLocationPageAnimationDone(bool val){
    allLocationPageAnimationDone = val;
    notifyListeners();
  }

  void updateMapPinExtend(bool val){
    mapPinExtend = val;
    notifyListeners();
  }

}
