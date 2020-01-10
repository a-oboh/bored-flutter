import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  bool openDrawer = false;

  void changeDrawerState() {
    openDrawer = !openDrawer;
    
    notifyListeners();
  }

  void closeDrawer() {
    openDrawer = false;
    
    notifyListeners();
  }
}
