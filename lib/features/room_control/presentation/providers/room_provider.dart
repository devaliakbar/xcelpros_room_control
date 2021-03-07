import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';

class RoomProvider extends ChangeNotifier {
  Color bulbColor = AppColors.yellowBulb;
  double bulbIntensity = 1.0;

  void changeBulbColor(Color newColor) {
    bulbColor = newColor;

    notifyListeners();
  }

  void changeBulbIntensity(double newBulbIntensity) {
    bulbIntensity = newBulbIntensity;

    notifyListeners();
  }

  void togglePower() {
    if (bulbIntensity > 0) {
      bulbIntensity = 0;
    } else {
      bulbIntensity = 1;
    }

    notifyListeners();
  }
}
