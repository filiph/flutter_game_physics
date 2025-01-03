// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';

class Step3 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    const speed = 100.0;
    ball.x = ball.x + speed * dt;
  }
}

class Cannonball extends CannonballBase {
  double x = 0;
  double y = 100;
}
