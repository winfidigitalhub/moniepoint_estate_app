import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {

  bool allHomePageAnimationDone = false;

  void updateAllHomePageAnimationDone(bool val){
    allHomePageAnimationDone = val;
    notifyListeners();
  }

}
