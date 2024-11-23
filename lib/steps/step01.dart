// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';

class Step1 extends World1 {
  final Cannonball ball = Cannonball();

  void update1() {
    // Update.
  }
}

class Cannonball extends CannonballBase {
  double x = 0;
  double y = 100;
}
