import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  String _username = "José";
  bool _enableReset = true;

  int get counter => _counter;
  String get username => _username;
  bool get enableReset => _enableReset;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }

  void setResetEnabled(bool value) {
    _enableReset = value;
    notifyListeners();
  }
}
