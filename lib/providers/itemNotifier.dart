import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int value;
  Counter() {
    value = 0;
  }

  void increment() {
    value++;
    notifyListeners();
  }
}
