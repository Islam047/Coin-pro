import 'dart:async';

import 'package:flutter/material.dart';

class SplashPageProvider extends ChangeNotifier {
  bool a = false;

  void animationSliding() {
    Timer(const Duration(milliseconds: 700), () {
      a = !a;
      notifyListeners();
    });
  }
}
