// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class Step4 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    const speed = 100.0;
    ball.position = ball.position + Vector2(speed * dt, 0);
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);
}
