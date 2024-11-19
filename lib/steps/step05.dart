// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math_64.dart';

class Step5 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    var velocity = Vector2(99, 20);
    ball.position = ball.position + velocity * dt;
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);
}
