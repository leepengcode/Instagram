import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class countProvider extends ChangeNotifier {
  int num = 0;
  int get _num => num;

  void IncreaseNum() {
    num++;
    notifyListeners();
  }
}
