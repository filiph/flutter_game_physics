// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';

class Step1 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    _update();
  }

  void _update() {
    // Update.
  }
}

class Cannonball extends CannonballBase {
  double x = 0;
  double y = 100;
}
