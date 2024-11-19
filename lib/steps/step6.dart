// ignore_for_file: annotate_overrides

import 'package:flutter_game_physics/world.dart';
import 'package:vector_math/vector_math.dart';

class Step6 extends World {
  final Cannonball ball = Cannonball();

  void update(double dt) {
    ball.position = ball.position + ball.velocity * dt;
  }
}

class Cannonball extends CannonballVectorBase {
  Vector2 position = Vector2(0, 100);

  Vector2 velocity = Vector2(99, 20);
}
