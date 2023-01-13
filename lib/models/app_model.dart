import 'package:flutter/material.dart';

class AppModel with ChangeNotifier {
  String? _intialRoute = '/Home';
  String? get getInitialRoute {
    return _intialRoute;
  }
  set setInitialRoute(String? route) {
    _intialRoute = route;
    notifyListeners();
  }
  void setRoute(String? route) {
    _intialRoute = route;
    notifyListeners();
  }


  int _currentPageIndex = 0;
  int get getcurrentPageIndex {
    return _currentPageIndex;
  }
  set setcurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
  void setPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
