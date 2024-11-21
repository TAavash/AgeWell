import 'package:flutter/material.dart';

class BpmProvider extends ChangeNotifier {
  int _bpmValue = 0;

  int get bpmValue => _bpmValue;

  void updateBpm(int newBpmValue) {
    _bpmValue = newBpmValue;
    notifyListeners();
  }
}
