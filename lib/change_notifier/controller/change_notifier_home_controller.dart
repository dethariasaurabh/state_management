import 'package:flutter/material.dart';

///  ChangeNotifierHomeController is the controller
///  which includes the variables and objects whose
///  states will be changed and need to update the
///  UI based on the state.

class ChangeNotifierHomeController extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  // To increase the counter...
  void increment() {
    _counter++;
    notifyListeners();
  }

  // To decrement the counter...
  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }
}
